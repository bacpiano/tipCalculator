//
//  DesignableView.swift
//  OchiGame
//
//  Created by Adrian Borcea on 7/23/17.
//  Copyright © 2017 Adrian Borcea. All rights reserved.
//
import UIKit

///this is a UIView extension to allow cornerRadius, borderWidth, borderColor
@IBDesignable class DesignableView: UIView {
  ///inspectable property of DesignableView class
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable weak var borderColor: UIColor? = UIColor.clear {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
}

@IBDesignable class DesignableSegmentedControl: UISegmentedControl {
  ///inspectable property of DesignableView class
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable weak var borderColor: UIColor? = UIColor.clear {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
}


@IBDesignable class DesignableLabel: UILabel {
  ///inspectable property of DesignableView class
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable weak var borderColor: UIColor? = UIColor.clear {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }

}

@IBDesignable class DesignableTextField: UITextField {
  ///inspectable property of DesignableView class
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  ///inspectable property of DesignableView class
  @IBInspectable weak var borderColor: UIColor? = UIColor.clear {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
}

