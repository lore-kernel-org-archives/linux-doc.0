Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6DA301477
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725322; cv=none; b=LpZHyxjk/uU8KPGrNUJPMZt2pccY3f560mDYrEqh9zFxvZCG5epi3cMFlDm0VMrga6XI02WyBYJMamSl5DWgM3dg0u3kBO88AN/o8GQE3X1ol9vIDNlp1wYimYujQXQnqNeEv3iFam5wku6Omj36KJLVgYvH88aw//xzuquud3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725322; c=relaxed/simple;
	bh=4IsV7Jk2i0IjnsnSne3q7Zle+vqi25l8etXE7cYgRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rei7vpx5vBTVPQSk3FPsgpjSGc4kkFY7HoBJyWJx5WZ1Ygkwb7yglNpxiHVW3YnP7Mgesu4oiz0cCQ8H5BurjLNhLdD+Nt5JtAAPMLAw/tvtlTZMBvOu26c8JVMKqWGFo57XWTR61fgVXujs7HZWXWA7rindNPcbBdISNAArt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYRf7YPO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYRf7YPO"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso6492614b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725320; x=1759330120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJWIOp92/VBWQGa84CQUa//9ShSJrAl7Jpy8tRSqKX0=;
        b=PYRf7YPOpDp+Sp5XALPzKko5U4BXuoL05ILooC3GS51tbK885v5nGFdf2ZPZa/5nTH
         zskN+1o+I+VcFJeWv+N+ar9a70fg1A0WT5y25LqgaxhiwAXaipuF3SNK6RTHBySnREmK
         S1khNGvqshtsEqzeCjU6qtlO3gvPaf4PMDrx6NSZesHzcLNc1cIzPjOnsKIBYy4n6L7V
         2/taPo+kCzzydBkdfSYsOfyKyr5Q5p/m0ZAz7QBOZe1PRyGWzTqeX1Dje0VlUakEyrDc
         2kZjsGFRmAlTJXFPfb/TxO9ulbkNTyKMvTxPvQMOjPZFrSRN8cxeuuX7O4vRe1fESSeo
         I2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725320; x=1759330120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJWIOp92/VBWQGa84CQUa//9ShSJrAl7Jpy8tRSqKX0=;
        b=vcpDFflDHytCOOk2UgFa7sfz886k0nuWAfdCbS9oDIiAhHj2Z9pYkoY09SSiAeMdjx
         BO0nBEZmoxoVSLUer6NoSiXjWTngfZILwVp3J8uIJoXwiVIwxn7tMMVZOgRo9LUivweE
         3gc9R+7atpj0U9+ywmBGO4DzGMIuK4SGWY08lWEq7NqHJ06yNhAbWCa/3oTQrdur9A/h
         IYxLBH6oEDhdGi6txiugYres7b2mUWsD/ecyCUd00mn+f+F9hohi6f6N3DnHRGzdWdS8
         pAsnlKLL9TvdHvDuKEyw1VXctGasiRue+yh/+dcc/jDs+j/rQaYHneRm82fAtZpuS4OJ
         Xmjg==
X-Forwarded-Encrypted: i=1; AJvYcCW03huhgR7XiR5MkX11Qxv3wGlSKZOcMvUGNrAsNsca6ZtEaELZcEBPfsAy3VoPakEALdmkS2TvscI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXOyBdbAKfgbX/2ne/l21yB8XhvPi5tRCXGVs8U5BkVTmzhHk
	obyBIXgaY5F/5MC/8KYGG0M0rPkhkNWGlm89L+4DcChscfJ9VJyybKUQ
X-Gm-Gg: ASbGncueAyFWsu3VUs3+Ge6mujUxjxYivrP3oKcc7CAPBMNVnVHkpdeEpfkVKl1XYAn
	aGSJk+wn9pr+/VR+A4Q9LsugBjpdsJMGC6MhhHYmWFNMaRZbSPwYDs9JATsARLoR5sv7eopGUJB
	4Hcp55yoNLmWKhCrnjWeAZ+XN0nKyndY0Br2anC3DnuZszVhjHWfi3L22ba663u2dcr+DJUQwv7
	cFYFpFM2dMfE9A6J/JJ1oUhP3LtHplRDuARTN4aI377b0v5PQPRWm3NaH7cCmce7lUlXRc0HxjY
	7msMOB5OZq8PP9tcpOptdsQqphVvxZ7OtPe61T1kq96qHmC05bfxRlmfT5/e5/EYDMlPQzaWEPq
	eVRjaMxQQelGNF9GIRWKYhFCrNUNtPhIfrnU=
X-Google-Smtp-Source: AGHT+IEMIvzVH3zVBoShxM3FTiWizXcSgelVZEcdTmdAc04uIJbP7xXcGfh18a6UZkI4nte1tsvgBQ==
X-Received: by 2002:a05:6a20:431b:b0:249:3006:7567 with SMTP id adf61e73a8af0-2cfe97e9b8amr8934175637.35.1758725320273;
        Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551f3ee095sm14195440a12.34.2025.09.24.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:48:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:48:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) increase timeout for
 locking ACPI mutex
Message-ID: <6a9bee4b-58b4-465f-b386-533bb2787cc7@roeck-us.net>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
 <20250923192935.11339-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923192935.11339-3-eugene.shalygin@gmail.com>

On Tue, Sep 23, 2025 at 09:26:56PM +0200, Eugene Shalygin wrote:
> From: Ben Copeland <ben.copeland@linaro.org>
> 
> Some motherboards require more time to acquire the ACPI mutex,
> causing "Failed to acquire mutex" messages to appear in the kernel log.
> Increase the timeout from 500ms to 800ms to accommodate these cases.
> 
> Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
