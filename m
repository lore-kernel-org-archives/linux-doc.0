Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B26286415
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599219; cv=none; b=Gm8G4e07H1Mnbwn99sbTNH8CzrvyrFONfVaRt9/EMpmcOCZbgJQ/aHFPWGe7vtoFkv1iGTGh8UA4h/RX9xlfpLe0PG6pduugchgjWLcmZy0ZGx6K+HXHTOQyDKEPq1hACtTk5MTOqy6RnlwdQbnJdra2f8ck4nzPTLjE7Wymbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599219; c=relaxed/simple;
	bh=C8KBltZBz0shXp0UC+0E2H1XlBJRZ+SECI8IyXlYY+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx6DMDMUqKv9UOym9DwLn5u8Y9aRUPLkhxE5qLQDz0iqV+YMoSH1knNAG7Y2hG6/1Id+ho4BO1EGrN40cc5pHmUj0pbbIz/fO9u1sZdHdaMp4PRr/pHTL86kox+1bdR+pNRUvrX7/TPtfParuh+RhZ6/6mUBMmIaOHszT2lWuaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxhsGmZ2; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxhsGmZ2"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124afd03fd1so3004485c88.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771599217; x=1772204017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2sH1xEnUbFZli4ZGw1UQSL+uYlLc6fkYPIZlNGvWzo=;
        b=MxhsGmZ2jBWkncmEvG43LMl/NxKly+Xc98C1+XqCvx8LHfUX2PfQ8dEjgo70HXwhKt
         yB1F2vNueLp6VjdDllGeY5olaXO3fpXyCsvbDhDGAm7Ml6WoBxyShI5WeLKHzCdJs/xc
         szFSTMO0HHvRaCpea3Y6OhTqitlAlQT9Nii4SSkvFpz0Wv3VdnjU8Uc5ajT9pSQzK5py
         DAtbQ710Vk1UZMDRXb5IgYVIW0UMG1p3+FbKupgarHLbCibR34/PwDQJrme8QW5pPHrg
         tlb771k8FHi4vvoudJvRJTr0hPTHP4CH7U4ggYNYFWBQ2dAJLbihWffZdiH4/05Ki/IF
         3MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599217; x=1772204017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2sH1xEnUbFZli4ZGw1UQSL+uYlLc6fkYPIZlNGvWzo=;
        b=Ge9AaUNOXOtpHDeWk8BT3KvodOkDz5FTg5TNw4FjFj3Djsfx+ElYtd6wsRTW7MwRRQ
         9dTXqpSL6g7SRsCe257bc3rAzGrr1faH5lUM76w/p3qlm20I1M4ICOkALt/JIAcRVZkJ
         Nc7lbSKu+N2wLMSy2wmFzs6MxnQlTB1KUQDA7BZWpfv7k34crR1KGF7wTKUzCuaD1FtD
         ZDLhxpPNr0tqiPV/G78768Pk33FseySVTxGdkpUYYN8UNYZ8OaGXulZRMLfRYP7OroPU
         zLQ086s75h0qB9eTdBE+hpg/uhHqdQvmj8bReKMWdXFtYircXiep1YmufWA0xc3Rz1Dt
         45Vw==
X-Gm-Message-State: AOJu0YxQayLUNniC6QjNDKmXn9kq9yIrCi6e88m22p5pCsWs60mpE5YS
	WS5f83LZCHXc0pKWSfE2E9auHtWzitZYGWUBiH1IxpqdwDEXUY90iRnA
X-Gm-Gg: AZuq6aIMQTKuADNXvgGcWrkOmzz5ApMe9D122qwUCv29TFu3jIljYfb5gv9gwQ/PpS1
	P/szCqjwUBjJPBwfx7qOmzkkxP3DBZH/Jr64QIQnShw5zSQDUiv+YN+DBecc8IyG/TfaKc9dMcB
	8PdsSoor5TfzZov753CsNfnwrP/AtZQgMLJcmKJLdA5FjuVuSYjeCgowG0IdYdPVs0+KD53Y5B9
	TNxO74xBJDYUaO1C3kt7EagCDoOuHrLSk6GgK+MO5/fgHG0HuZTyyBpHgYnKB1CLpJXnUX8Q3Ph
	VR9VmR6YEsEb5iiA7Qq48p4RpjHvoeO4S7dfDK91Ks3XXFcixCi+uVbDc88j4ZIfiuJJXjynLgF
	w7mjEGx7k5Y8yskNWJR//Sxp+Pu9BT8OyxTlEzG/4skpft/w8UIQPzcJxQiJb03vPwqQwQCf4Di
	Mo8OVHms3iq4RkASnHs+hjni5QDILumIN2XvGP
X-Received: by 2002:a05:7022:6192:b0:123:33c3:7c7e with SMTP id a92af1059eb24-12741bd058dmr9618535c88.37.1771599217148;
        Fri, 20 Feb 2026 06:53:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658544sm26813575eec.17.2026.02.20.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:53:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 06:53:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Kalhan Trisal <kalhan.trisal@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] hwmon: (emc1403) correct a malformed email address
Message-ID: <a29d7f6c-d809-47c7-ab34-220159c4067e@roeck-us.net>
References: <20260215010327.1687304-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215010327.1687304-1-rdunlap@infradead.org>

On Sat, Feb 14, 2026 at 05:03:27PM -0800, Randy Dunlap wrote:
> Add a closing '>' to Kalhan's emaill address.
> 
> line 60:  Kalhan Trisal <kalhan.trisal@intel.com
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
