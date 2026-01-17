Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B342E6CD2
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768691436; cv=none; b=ZPmvHs7rm7Q8AT6gG/WCnqY4uXo15LhkoM3ajD3yRV/Kwm/4yMqaUb74iVgoPA2DpM4vxmaLDPtfjOURvaTkHryCFSWaSzURyVP10KREYyJZqRSEap4KnkzJJ1A+BDLIDL+3pbbNAq9JESsRAMYSdCcR9o8F7xhd0fPv3af2JVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768691436; c=relaxed/simple;
	bh=wAlNjdCJRie7stmfZa9WM2zSboeZjYbmYAySTdlVC8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWtiF/xu6AoGq++LSHH1qLHayYgWM+51WZ9axqzeFxsGoIhZVUtB1Vg1hZIVtYGiyChSvNczFFljsSWdV7y6v6JCFxmCDr2WfMyWr0aUmhnX/SeYQmmFkMDWTLZLCC4bOKSyUaP8cjLPlr4BKA+Brt2dFhefoR5BYPrhD7jdBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fURzfwpF; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fURzfwpF"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233bc1117fso2073516c88.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 15:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768691435; x=1769296235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8Sm/ib2yrFoZ//zI729/fFHatA05xvif8fBBX0u8IA=;
        b=fURzfwpFePuzbs2K2UPhO2URTaO9H1/lI7VAtINaiTmwzwm9YG9H21LgdAi9VygPIL
         9us1uj1+G5uha29HaCQRrTXBbQuZpFghctW+tDidzGX5uFLkGtNELvAYB+fyw52qOlLi
         T+1GYrIgoT3nXmn2c3KYY2fGQWqjgp0Rty4DaIY3x2QVfFGboLinSbK9Wn23M8a7HlOZ
         PvSscLNcX1N3uPzNP0XECkvjSBTKwkbWUiFK1og++otBR0T3+hnpacCwrQN/T6ev2wOz
         k0if2j8BBKnAziPC4F1PKdnXxwFI7EuJ/ZMq4MiFqIdNV9QM0pazlyv0OdMA3PE5qqDR
         I2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768691435; x=1769296235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8Sm/ib2yrFoZ//zI729/fFHatA05xvif8fBBX0u8IA=;
        b=iPYfpL3J1njRddh8uNwNXzap9TwgkVxlhpRR7DbfcE3yjiuqxxLRjH1G3O5XrfUslK
         SL08YmLh6SFxxX1rWj9N1KTZjFxZo95To7VCLEI4w1jYc51W2YybVvAVZs3FzT3l/Emr
         GWjCo0rOEqQ/8OJI0g6hWgT2Ro/PdfxTTgY7lwu0TqY5Par3tRZzij6BJld9ptEsopd/
         557yDXJWTo374z/WjVcZh0sOD360zraPTb6u0hx83w/qXs1RgXi9n5FVzaTqgDrSOglu
         Dsw77Y2QNS3cN7Q6KOL9hVNPIqDPErblNpmWiVJjQqeTnbEMXDsgzJxRjTTa8HEs9Pch
         TUlg==
X-Forwarded-Encrypted: i=1; AJvYcCVKaUx4eBGsT+YKv8LBlBIvwA3QK2KUdC9i/p9pTdWFEL4vYfh5L3GWW4Xb6PTYE+lS0KK0nVyCzE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJAp8KnQ2YikICOk6bUhuWUVlIFDGLeMtf1mhUejDdOrstRqS
	0B/TmkaRkP5tAjtxgFBJyuwtPGZlNvrFGZSNkY9xe9KYmWUShTOlmPGRVngyTw==
X-Gm-Gg: AY/fxX75eEbmdGtEyhrtU8MXlz41HKepCWbyAoozlCbPo0+DGgSxrCO9fb87OZ/mwmM
	6W0NoZn9sQLHEPqdRoxO5q3WtgushNVYZH5+10FnXy0GNSUbZiRDWMBB+JgD0SWGFNgyqu+2cxi
	onM7bzJpqfGPPbQbfLPVOcr8W1f90/hDK4QwJCxhaVIjRFFilK9WG1yY5ECXVEtx3ibezmaLp34
	j+cDHoSzQDDyJOWcv0GG6In52xiN/7Aqa7TmblW3WUAwEk2J+9uXsC9h9NlynMdudsjEhU5gXNq
	Z1H3oH9fkkkwqlevlg1UEmEOX0/HKanjjG+fnZCb6xIbrXn93LvJH0WRzNL5SO7KoQt94lUWNrI
	mAS5Cld12+C0H44fiaQlPIa8PmjlcEIzrQFMW9VRaCeixy1970Rko8jxdfs9G92uklTUXtW5KcZ
	yl7ZM1lpLIXV4FN3pXQH5rZeI3
X-Received: by 2002:a05:7022:f9e:b0:11e:3e9:3e92 with SMTP id a92af1059eb24-1233d11123dmr10057180c88.23.1768691434545;
        Sat, 17 Jan 2026 15:10:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm8824218c88.7.2026.01.17.15.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 15:10:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 17 Jan 2026 15:10:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Benoit Masson <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature
 resources
Message-ID: <174f13cc-f4a5-4fe4-b0e4-1107c90309b7@roeck-us.net>
References: <20260114221210.98071-1-yahoo@perenite.com>
 <20260114221210.98071-2-yahoo@perenite.com>
 <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
 <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>

On Sat, Jan 17, 2026 at 11:11:32PM +0100, Benoit Masson wrote:
> On Sat, Jan 17, 2026 at 3:39 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > Series applied.
> Guenter, my appologies but after changing some BIOS parameters of the
> IT8613E it seems the patch has something wrong and creates a null
> pointer exception. Can you please remove patch for now until I test
> all BIOS/changes before re-submiting. I'm sorry for the miss here and
> your work pushing for this but prefer to prevent the patch for getting
> deeping in the submission chain.
> 

Does this help ? It is what Gemini had to say about your series.

Guenter

---
My analysis of the top 5 patches in the it87 driver reveals a NULL pointer regression introduced by the series.

  The regression is caused by the addition of the IT8613E chip support in commits 8e6b5dcdb757 and 21506a88d3d5. These commits failed to initialize the .reg_pwm field for the it8613 entry in the it87_devices array.

  Technical Details:
   1. Commit `2fc4e2363316` introduced a new pointer field reg_pwm to struct it87_devices and struct it87_data. It also updated the it87_reg_pwm helper to dereference this pointer:

   1     static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
   2     {
   3         return data->reg_pwm[nr];
   4     }
   2. Commit `8e6b5dcdb757` added the it8613 entry to the it87_devices array but missed the .reg_pwm initialization (leaving it as NULL).
   3. Commit `21506a88d3d5` further configured the it8613 entry but still did not provide a .reg_pwm value.
   4. Registration Crash: During the probe of an IT8613E chip, it87_probe sets data->reg_pwm = chip->reg_pwm (which is NULL). It then calls it87_check_pwm(dev), which calls it87_reg_pwm(data, i). This result in a NULL pointer dereference
      when attempting to access data->reg_pwm[i].

  Why commit f977d3bf3614 was suspected:
  While commit f977d3bf3614 itself is technically safe (as it only added resource counts which were initialized for all existing chips at the time), it was the first patch in the series that introduced per-chip configuration requirements.
  The user likely associated the crash with this starting point of the series.

  Conclusion:
  The bug is in the it8613 device definition. It must be updated to include .reg_pwm = IT87_REG_PWM (or the appropriate register map for that chip). Additionally, there is a potential out-of-bounds access in it87_update_device because it8613
  defines .num_temp_offset = 6, but the IT87_REG_TEMP_OFFSET array only has 3 elements.

