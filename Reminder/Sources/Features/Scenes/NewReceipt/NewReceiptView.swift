//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Jean Ramalho on 05/08/26.
//
import Foundation
import UIKit

class NewReceiptView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.heading
        label.textColor =  Colors.primaryRedBase
        label.text = "Nova Receita"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.body
        label.textColor = Colors.gray200
        label.text = "Adicione a sua prescriação médica para receber lembretes de quando tomar seu medicamento"
        label.numberOfLines = 0
        return label
    }()
    
    let remedyinput = Input(title: "Remédio", placeholder: "Nome do Medicamento")
    let timeInput =  Input(title: "Horário", placeholder: "12:00")
    let recurrenceInput = Input(title: "Recorrência", placeholder: "Selecione")
    let takeNowCheckBox = Checkbox(title: "Tomar agora")
    
    let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let recurrencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let recurrenceOpitons = [
        "De hora em hora",
        "2 em 2 horas",
        "4 em 4 horas",
        "6 em 6 horas",
        "8 em 8 horas",
        "12 em 12 horas",
        "1 ao dia"
    ]
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Adicionar", for: .normal)
        button.titleLabel?.font = Typograph.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.setTitleColor(Colors.gray800, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        setupHierarchy()
        setupConstraints()
        setupTimeInput()
        setupRecurrenceInput()
    }
    
    private func setupHierarchy() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(remedyinput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        addSubview(takeNowCheckBox)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.small),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            remedyinput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.medium),
            remedyinput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            remedyinput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            timeInput.topAnchor.constraint(equalTo: remedyinput.bottomAnchor, constant: Metrics.medium),
            timeInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            timeInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            recurrenceInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            takeNowCheckBox.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.medium),
            takeNowCheckBox.leadingAnchor.constraint(equalTo: recurrenceInput.leadingAnchor),
            takeNowCheckBox.trailingAnchor.constraint(equalTo: recurrenceInput.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.heightAnchor.constraint(equalToConstant: 56),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.high),
        ])
    }
    
    private func setupTimeInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectTime))
        toolbar.setItems([doneButton], animated: true)
        
        timeInput.textField.inputView = timePicker
        timeInput.textField.inputAccessoryView = toolbar
    }
    
    private func setupRecurrenceInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectRecurrence))
        toolbar.setItems([doneButton], animated: true)
        
        recurrenceInput.textField.inputView = timePicker
        recurrenceInput.textField.inputAccessoryView = toolbar
        
        recurrencePicker.delegate = self
        recurrencePicker.dataSource = self
    }
    
    private func setupObservers() {
        remedyinput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingChanged)
    }
    
    private func validateInputs() {
        let isRemedyFilled = !(remedyinput.textField.text ?? "").isEmpty
        let isTimeFilled = !(timeInput.textField.text ?? "").isEmpty
        let isRecurrenceFilled = !(recurrenceInput.textField.text ?? "").isEmpty
        
        addButton.isEnabled = isRemedyFilled && isTimeFilled && isRecurrenceFilled
    }
    
    @objc
    private func didSelectTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeInput.textField.text = formatter.string(from: timePicker.date)
        timeInput.textField.resignFirstResponder()
    }
    
    @objc
    private func didSelectRecurrence() {
        let selectedRow = recurrencePicker.selectedRow(inComponent: 0)
        recurrenceInput.textField.text = recurrenceOpitons[selectedRow]
        recurrenceInput.textField.resignFirstResponder()
    }
    
    @objc
    private func inputDidChange() {
        
    }
}

extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recurrenceOpitons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recurrenceOpitons[row]
    }
}
