Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457AB29B233
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978167; cv=none; b=XRST7tUkxh5XrWLsj0qM797ZAfa9AWtj2oTkYT8BXXKxvL3jRXwpMTN44dxKKpof41PVK6pxylW5+5VVZgtp890CRYMEfZNo/inbXqQcemwfrVHwRNUSd1/lkfUlbbAavbLe6ZyOK007T8TiACV41GHKhXEWtz2RMlSJgvj/ePs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978167; c=relaxed/simple;
	bh=Er3oR6+PkdlXB4XEzW4SKH+apkSu3gszkGr+FTLFVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1zQXM8x3a0fHdAqxs6L8YkQXUhfRhP9MzCljurJyg2sMsuCmxjaR976ScUoxymrp8szRk68+iVzoNUBCJ7CPh6yMWnD2Ed0yRFmcgDAkG0ay5HTJLkLAcoWdkCgE9Gwzu/V/HFfaQ9wlND6kTqcNxNHxXfbeVRN29uU/2W3SzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egm8LDRI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egm8LDRI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso36591a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978166; x=1763582966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmvW00LBZ50ailbcS9XTnsttPz016ujPos9JYGgCAT4=;
        b=Egm8LDRIswfqLLZ9M0ef0fAphIw5jfBH3MhXlu5EwvyG6nTXpcAf3k5+mBwpPvai91
         lOXgxYPCkv0B757PDkO8lZW8TpzpCWWcNHOEWLxuN2Bsjz87fQeRyxI3Q3EBvWwiGydJ
         Mt0TZKuaZjKFmVdHtfREesMcY4Ceq5jilGQ0HaWyFXfnHOWDAkTfUNyORJ3dscADIc24
         MeZ1lNDkQxd04itdd6XugVokwcow9zlnqDDKpCja7YsnfHq72ncVjTv1Ve2DBZ3tNyhm
         VhF6lrJyNqGqFlNaK9K9kuvfecWf1utpuooAX0NSZtNb2ujNVuWxYAPce7UcyIAxPGnQ
         NRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978166; x=1763582966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NmvW00LBZ50ailbcS9XTnsttPz016ujPos9JYGgCAT4=;
        b=jaKgV6ve1NQbjUuATckPK3s71bWdtEK5tiu+t0XfzKMYtcOkMYNwHY5Q4iieJy6WiA
         vTCdM6A0CvasVhT66zEBP9o/0lDjWUwhxzgq0C17cWJ91eGyaLWLFNzFE6fXqyMMPb6z
         UB8wYW68TSsmYHwOd4jMXQ0RLImd/siUtGg7WWHfUarcO9M9pL/FELGa/SPg5rjHnEWH
         283ziNk40ZnuJ5qxueBE41q72Wkp8SHh65xgO0N2JWfQFJ+u5SYtk8g+z7Z4LWUyWDIV
         QOKbt39wqHS0uxEjpcYssCO8UYGAr0C7D2w8mZzUNoeO64L/yPh/5KIoNQ40bIzHudJ5
         UTaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK2Bz19WVnpXc/sBV/H+4UhN5Dvj1DbWWdSkxuj+G4YGsxp+h4X4ikBJX7Ncs6dTknmI+Fu2rF3LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00DhPgVUAHiwwX+B1O470DFRtkrDAgQRD881HEyHgnU8mRZWv
	R6QrbCiSbSVxf1WQoncagoNs+/wkugYyxbAiTfn8kPI4Cp96MXe8GfSZ
X-Gm-Gg: ASbGnctVv6i4DyDQXX6IGwtEzKkZDzWvzApIk+/0F9Jq/UW7fAZNhscet6t1Tcq4DDS
	Oytdetr7qyWlZm2LDH+rl9i6Ux9Ztt42z4yIAge9LuVaojpeCSsSnfJdqM+uKZoBRuqeUBEePIA
	pAoha/N65Zgbt4RJg54+/fS2XNJ9h5y1JoDq9/ZVQaak2xG+yf03rRmzo9qQWXZYAurBkRkiq9R
	5qUVPVQlCwOVi17eGu8R/fTpG17/gCpML/siUx7NKYQYwMVZfcRbhg6vjKLp97ZSVP0lO3Chuwn
	l5mI0YfKg8hxtZd4xSYBlBJOggzDBwd+irOa8CzMvb8NVTkL0QP7unG2hITNKOYQxlJB+NpuLsP
	sGQFB9iit2zdpjfH9BnvE5/fatJ8Mjd/3NYWqNWsszTYEnPOtOV9Nn5/ToMxfulXlSWK5+xSyZV
	PuRwuakpfWdFxB
X-Google-Smtp-Source: AGHT+IFItecs7CrhbyEkdqRwaoHcd+iAO6zPDCEwo/LpsTI1JbO3EYuhCISQUIPuyHp328lDKaraXA==
X-Received: by 2002:a17:902:f70a:b0:290:c516:8c53 with SMTP id d9443c01a7336-2984eddf03dmr51151495ad.40.1762978165661;
        Wed, 12 Nov 2025 12:09:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dce80f3sm39020015ad.106.2025.11.12.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:09:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:09:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 2/2] hwmon: Add TSC1641 I2C power monitor driver
Message-ID: <c02c8209-8f96-4ff7-992d-c81af54d5604@roeck-us.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
 <20251105201406.1210856-3-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105201406.1210856-3-igor@reznichenko.net>

On Wed, Nov 05, 2025 at 12:14:06PM -0800, Igor Reznichenko wrote:
> Add a driver for the ST Microelectronics TSC1641 16-bit high-precision
> power monitor. The driver supports reading bus voltage, current, power,
> and temperature. Sysfs attributes are exposed for shunt resistor and
> update interval. The driver integrates with the hwmon subsystem and
> supports optional ALERT pin polarity configuration.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Applied.

Thanks,
Guenter
