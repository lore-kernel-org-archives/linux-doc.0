Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E212357D0F
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883993; cv=none; b=c5qUR+vYQeC0F/Mowa48YVmQ4N4q5pUctWEMbj5SH3Lk4BClhAJDZZlJxBoG902SrarhUB8CFUyhjQGa58cnVpvPyYJRDVOZSOqmWu5HBVmVW/1VcsdCW41D1QDa2qSWSFSVkUdw0rq0OhnWNmVj5ftaPKsyN5nhYCHR2g9DCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883993; c=relaxed/simple;
	bh=uH6of9n2rBHWfIQOS9mKxTMhHVx2BH+BmV3w17ToNbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKMa9AN/uVeZeYSXyUKUo0QvfZ7pt0e3a+OOppIqy99/63TCpjujnzwY3TCovSxUktuA83jSZhW0XJekN30b7CeFiA1d5zXQJmxwhx6ViEFniFLtDZtiBskJ695UtqOmkIyzzguOKF/Crsa8JzVCLFjHSAfv2y7FAz5fGzkyZ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxqzrxwi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxqzrxwi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3911737a91.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883972; x=1789488772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=fxqzrxwi2bzga5/vC5mqkMfyxdXc9OjpkhgB2nu/QvIEaAWPMVL6MciTrSgFUNYWu3
         RjM8v+ptYG/PzK+3bmx4rc4wbwG08FUHhcsRSOvroG8RrCcjSY06fAtta8wLB+2MFF/Q
         +jAYXoAIsXdEYUODcdnyEriJYSuu1/RDtQzW8/r097SLQ0cfRfqs80xoLPI8PAo8VzR8
         Dfzo1ZN6m1MxnFG5gQq/BwbQkMTJRCkPxwL7HGGkD5gs+GnPhbgm9cahAlp16dcAOpwN
         xlWrLBeYo+iH5AyMZ4PDqiU6zDp2vS07v3FvuL8SWi6a3mAEQX2DswpV3PZFmk9bVoPP
         cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883972; x=1789488772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=kqr4jNbVFbKKW0pQ0G2cptX02jTG+K08n+9OjkY5ZOxp3roukCBwNwKMq5uzTad9kX
         oynoCDUqvJ9B+Dd8/EzFDk+RStmjkNjCzWcGUmRWd96QiXHgtn/eI4KuvFnFbQDEwqSH
         mzl7Afj+maJxDB47VOyPQMqRcXE/xN5ID+xwxcd83XIlD/pyUTbt9cloHtMqgFrfRXVd
         5QQC8AZSUoQbEcQLRPajegBxlJZwzOuX3r+1LFr04qm0NCY0K13pUNaxu8wyCCCnC87E
         OOMSgvIrlWUhMtlnNusQzYtGgGQMLvEwM3D7L3lxhS0Ej01qG7dfs0sB8KyoPX3oovGs
         bDrw==
X-Forwarded-Encrypted: i=1; AKwUvBxu7sxHuObVsIlmqywpqgz61V9ZFH92QXdNQodMNu21o5TLq7jy+/LwnVNEbYYmhrfO1clYMgE2x1M=@vger.kernel.org
X-Gm-Message-State: AFuF++m7F4eI+Sda8verCI4TpT8O9QsxdeYBjTy9MTnmDVg2AKTkTxv/
	5M1DtVlJ2q4AHmmHUP0soxv9ZmB+PQu0IyLR4F7SyjUbH3t+u1CczFqv
X-Gm-Gg: AYBFou2YC7tGTg16WLLhHq+o5rrK4k1isfQaZp0w06Aol0kuJNJAvHOpJuIL9/tBtZD
	CZX3L5og0zTTorOxXluEpy43KrCHLEL3qyxgGVKEO0gxDhwVwSUs1B4Y+cvZf+YPIpPxyCsmPH5
	WmlKxMLNlgYhbEauYWgKqWbHzNQFIBwBg7DadzuoplhOI5GzNqcG22n+0RxRlRMZc3bLBp70wD7
	LgsbRLCl4y1jpt8FRyASXv4c0bkiPgANBXwgDf7DsRHnXaGLDKx9a6J1MiWf+WhZ0ZfXgX3ewbx
	qVmyS5zJQjhfFvxykdPBVNJx/3wXmLhdCbcoJ7InZVVg+o9Z7MCrJykI17sTK+5WVBoT68XNdNE
	eurCAGN7nDr8xIciLgh/7uYAAnnfFpfc1ufFfVU6QZhuhaqCqVZDwTKLIIwj6g6eUtgJyjjChbl
	ewTruZrya59x/bmskp3T3cZS6UanuzVziWitzwklwqnyutTxw816dyK2Yh7Y0yuDCqbjqGFWWWZ
	Q==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
