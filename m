Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354D41D65C
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154295; cv=none; b=CvQswAh4sxRBLKUw8OQF02WCochnJVnHe+EKCd7yiDZ4g5a4+HoV61UBtmC02NmHFgvfgYy+qDxaZkBmujpRMB6oXgmWFR3M+UmHKiXb01iBQ7kBV1R96hbyIIdN7LpdR4uKUdDvaoUE8AlphCDLlEHjf1kCvsfschjEhGi3QaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154295; c=relaxed/simple;
	bh=GavbH/nr5dcl+tzw53fPPEhoAOTJmDbERpgNBFQTspA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8Fwx8SzLmQCh9KJSOWnPN+f24kYqfwIwMcp/27ji4vRcUMKvTrAi6iY5np1gHP0Qdv+ZW2PWDl28zofZu2Nz/LxFIOqH9z45A88bkYdGvX+MErygHkFtXM/lT5Ooy7/ESiw6j1DGWBeoeMkhYKHKc4JKOa/SKoxazreriPZFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgjVbOvO; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgjVbOvO"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8623e5d435cso89835b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154283; x=1789759083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=CgjVbOvOfqLCyl/azVTmVXEcLMwN2Tnk0WtYm6aRDEIFeG3nQfxaQh3Z1nsN8fzAs0
         81hG1NdN2p1s0k9L4OKbQGACktOebG/79ppEKjWKgZBF5pyjxZxG4EvaTMIkfIBhcJ6p
         sbvF9Oj49NXaqp2dHntboPhtvJN8ehrHlOelClQSqpHSzKutg9QXOGfhutyr+XYUNu+B
         dVRtbxjPYxK0smL1ETIvZNkX+Mj/tlJo+hVJ3u6yRHGUrTwMoARhNglZRlJ89/pFD5g5
         unPzLkFY5zCgzC7o1vALgBde18Hh7ygsh/cbZ0buMT1yXlZR3OuuR5ofryJ9NmrlUCje
         kWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154283; x=1789759083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=Yz3Xrb5ooSezkhF+AbRrxd9Op1fttBLi3gHeKlrc/eaKZiGHJPgCPrbqP5pRvHApYi
         FLD2R0b2aOKQEL8KNWVzu4JIqhPB1jSyhL5mvJcF6Ncur/cRIL3Bg7577o/Gy/5aX9aE
         d8RcyZ5bavUX8b4z31OwngrBU3wWwWkMadW63UrkzEiow1nSDK25Sp3vciVlJDiugFnm
         4J1dM5phV1KmV24S+Z/HSusKcNZCHHfYbyGWSLEjrAm0OmD1rzqpibQQieLJlMWaONMA
         gfD/ZGxbSVt/IPIcQyPbFq8Y3l7uE3UZkj8Lhbz1SmAQevAkqhrmXZ6KA9Vt7kP+eoVh
         Z5xg==
X-Forwarded-Encrypted: i=1; AKwUvBx0Emjd7T7+9y9ymDV9Xvdzjqvy8MdxDWQnZaVr41p1m6QS3Ggrmv2bv6m4BIviloE9+ec2yxc69Rc=@vger.kernel.org
X-Gm-Message-State: AFuF++lce8zfSn+FVButLk/2p4ZLGo8HZ0vQfnmXiKuSMBpuJGVzJCia
	n7pgSz5Pct5I4kH6XACquoXW+quEaVnZBhZcgPSWqWk4oOiHBhzFoc0V
X-Gm-Gg: AYBFou1SqqX6gjzBFDEqGvpNdAHOM5xtsV4NU8GRlsTphg8NkKxBZi8EpMk/RiJYnRz
	sscV68Ds1ytvSBQZ/O2LTcX63XsSm7axUH10eHyBTIJtBvECNdkUCEcrAJWcOY3sPB7nRbVWC30
	pEEuXBTQ6zAavJdygH1PPe0mda28B6k2bLm+b9CLq1/5k9lG97mQV1HWpCK19RBh4ZkfmFKXD+W
	nyNHynd34oq07dT+UiStGBSvoyi8i51KzbmcCcaAeV2fQ7aZx653Xf+CQ2s1NA+G69YXyTGCLUj
	DTl9UE8qEuh/xSR+yKtbD9Waw8o3BPHcDnV2pEY7CV5SbGOLQhp+oX9/aagQk98/54YkC4DPkYn
	XMqp1yrnVP7BYvjImVisV7smPS90Y+QUaaJ87xTTXBsa+ugYxfXNj1nUEYUpxgp/cs5gALji6Jg
	5W4DAJpHSSuweUHMzKTrPF+SkfXpJgVUNCb2/hQ37LfEpPPdc6h1d5Jm8CjY3oCUMN7AYWOXFO4
	GgqGQDdWnMO
X-Received: by 2002:a05:6a00:ae19:b0:86b:4366:b5ab with SMTP id d2e1a72fcca58-86b4366b78emr4472376b3a.9.1789154282668;
        Fri, 11 Sep 2026 12:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1616392b3a.31.2026.09.11.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:18:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (cgbc-hwmon): Add some sensors
Message-ID: <1fea779c-454d-4afc-bf9e-10e5236f1d21@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:59PM +0200, Thomas Richard (congatec GmbH) wrote:
> Add the following sensors:
> - Alternate Board Temperature (temp11_input)
> - Top DIMM 1-7 Temperature (temp12_input to temp18_input)
> - Bottom DIMM 1 Temperature (temp19_input)
> - 12V Standby Voltage (in14_input)
> 
> This fixes the following warning on conga-SA7:
> 
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Also update existing labels to match Congatec documentation.
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
