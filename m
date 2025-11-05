Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880872264B1
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 05:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762319354; cv=none; b=atRM5m8q7zXI2r9QAaPxlrV8XneKxsfUHh2lOtQXl4E84G9DDEg69pQlzF47I7krJx8LHh2FhUbS/KSesRXvQH+kFklB8J1xpRcEHgz2PAG84yztNttU6EzqI7wa8Aqu9Z9OX2HGOIywGCG89B0EOVjil43IDq55Vy7K7PHJgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762319354; c=relaxed/simple;
	bh=ybZ89ka7wGDINL+cQOZrFSb4b+fijqyUProWsGPBleQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zozv07LKKDX0mdKusfOjAeqA0MOQv8qn94InUh7wfNwfRrALfIpgzZXbG0iieytepxvxjuZAesyH9YBUIgtJYj808kjoRxeiL1RCm9Is1Mati24KMZnfQQkZxKaKxtsTQzjcqDDrwsgOpAd045nsF8Wmj01cwgx1qolHCwMDmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh97NCMp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh97NCMp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so365154a12.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 21:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762319353; x=1762924153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4jMs5y2tALWypfJmfBRbWA98qIJqfeZbOrWjS2kNYg=;
        b=Zh97NCMpsXcF82FLlFBC+RV/2yzgdrQBS5+t66RJ4W+uUt3GEidnLL3fkbHzYFXiLK
         OF5FLIqLA9ZGqsk6tam+Ui8F6crhCw2TnlTmuPO5lUBVQhbVlP4me5/3G5jTZ1njrhCF
         AHms37BJ/Za+fUT0cg6I/J+R2VuP/+WflbGPF/LmPGurXYnNmXiJlqftkbZUD0tE+9o6
         qzhsyf8OQEXI48WjXM4bpplcT6ge1hO6PJZAK5ArKK5AGWhyYfYWnuw3YkFgjc57+xeV
         X/+EkZV9aHcXEhFpG34/lO0AXE0pX+k2MWpFZ+hsSXVeRypmw0rFGV8TSSx87yvZ5tc2
         xcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762319353; x=1762924153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4jMs5y2tALWypfJmfBRbWA98qIJqfeZbOrWjS2kNYg=;
        b=TbtPwssITGDVCbaZxYjb8CtnVC0RLXRS24sGSv8frZJqB5ezpuPHMUqCScAmJf4y9r
         n2BxfC/bOPtUf9Jil/kGx9fbKRWojLOXUIXiAqFswwdJDhGhDB7AVj/kjLk/+nkxzoTl
         Vmi3k/ubi6sO1G0CKnKHo1NPe95FSxMvcMpsWTQCvy1/h/2DnPvN9FUnakuE+4/XMff6
         9fbg8Yn6oYGdSurRZo2rY9x3SzazdcuGl5g+ybt8AiWv0lCDn/pkjxVvr10S/h/kJIX+
         dpmVZaYYYSkEZESGEwbMwPLqXKwEtW2S8fH9ITH9x5WgoE851sb63IWnaMlYgDcxHS28
         XgLA==
X-Forwarded-Encrypted: i=1; AJvYcCUVvcuU2Gab3LTL4b2i2qdUuJvIiSj2f5b7gyf4DRXPiJDFp7rMFrb8gXKMBf2ljDV/mv8evaoZ8n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAh8FiTtgxBQl4gYhzZVK5pBhf9nTw7jjD6PW7/XTUm1958XD+
	fEawD1oaFFxv9xHakmskr5XbxXnpIFZ9Fzyz68OMfHWOmtgH6OV4VXnu
X-Gm-Gg: ASbGncv+sCPCVHpK7nBqYHqEQYe1M2tT33uR3PoewgJqv2PbnDjgqH2pChmaSHYqK6y
	/S/I2t3g2s3JA02VeYlhCsQKISQ6aozdUlvQRQAFqxLrJkEF++BwUo33E3dOCUQwGTJjZo++5wQ
	b5l4Yn+KGZIALsqrgTUWSKUsXmFrYTPxvAhKOueqPFXZHeyRarHtQlug82jrWo8OFav0pMh5IGw
	i2SKUX80aFfU6Q4oQePvuX3sV+MhB4nErsQIwZaCIJDPecTl2MJQ9jEpL+pphmicI33hYXkbPIc
	kfaIljoMRilqNnCLrK+amfHVrdbLwW6oyHEHEHsWkN1SorkHo0fIlfHtYm4VOPFt951GBrAcjrd
	yxMN8CtHbVEz/cXiSFcd11/Wtw04OHnDt/ovpILSLLcuM9Fm2YUbp9yvbmbnO1IHGoKC/aO2sqH
	e84LCRJH2ZsKH5m8CPodNWWUArnrf1QdGGJlrQEmRgxA==
X-Google-Smtp-Source: AGHT+IEr5MKnCuWVOr8OEra4PZxiRaRvqfcFqibr+fC/r+4cxI7Bcc7xaonLIv80+FULlN3GIHRogw==
X-Received: by 2002:a05:6a20:734b:b0:342:1d16:80e with SMTP id adf61e73a8af0-34f6f7d100cmr2761252637.4.1762319352618;
        Tue, 04 Nov 2025 21:09:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86b3:15ed:c006:18d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd5d57827sm4777076b3a.51.2025.11.04.21.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:09:12 -0800 (PST)
Date: Tue, 4 Nov 2025 21:09:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: input: expand
 INPUT_PROP_HAPTIC_TOUCHPAD to all pressure pads
Message-ID: <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>
References: <20251030011735.GA969565@quokka>
 <20251031041245.GA1316325@quokka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031041245.GA1316325@quokka>

Hi Peter,

On Fri, Oct 31, 2025 at 02:12:45PM +1000, Peter Hutterer wrote:
> Definition: "pressure pad" used here as all touchpads that use physical
> pressure to convert to click without physical hinges. Also called haptic
> touchpads in general parlance, Synaptics calls them ForcePads.
> 
> Most (all?) pressure pads are currently advertised as
> INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> commit 20ccc8dd38a3 ("Documentation: input: define
> ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> provide this information.
> 
> In userspace it's thus impossible to determine whether a device is a
> true pressure pad (pressure equals pressure) or a normal clickpad with
> (pressure equals finger size).
> 
> Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> have support for userspace-controlled effects. Let's expand that
> definition to include all haptic touchpads (pressure pads) since those
> that do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> - pressurepad with haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC

Should we maybe rename it to INPUT_PROP_PRESSURE_TOUCHPAD? We are within
a release of introducing it, so we should be able to rename it without
much fallout.

Thanks.

-- 
Dmitry
