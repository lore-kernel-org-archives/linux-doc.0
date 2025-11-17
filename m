Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81622242D88
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356390; cv=none; b=u9SiVM78+qy6bGcBBndQbsf6XFiBTQLPD5gS39jn0qRELMOZ5S3ZnCUVlKF7CRfpYCHB2LLtmfIWd8aboRB9AbfUmqpVveMamPXrhsAAtcQ3QQ6+kAAxSiDA9ABfcQN1I/QRR+E/PvAsW/s3PKYRGXXJiqNH0OArEcE/uKelMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356390; c=relaxed/simple;
	bh=RFz0HdzmVVUtlAL2YIcAz5OmsHY1vYdhkjChbRV7Q9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goDqFIMUMOT/uJqXTbDpIXdCc5GOCTeKWgttmwwoYUva9r+jcEhbsWw0apdmnNwRAw6CEFk8iT8xUAr1mcdNyl+VOvIsKYqyTfj5SNi2m9dJpcc7PX3T38gROYYC+yX/WnAatJqigh2Yj6IpWMK6Fm8JK/mVOSUXMCCOFpccKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZfvSWcB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZfvSWcB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735487129fso588300966b.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763356387; x=1763961187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLj68r+HP4hgUScOTww7dJJLSGhpNeyhKtXx00Sgp90=;
        b=cZfvSWcBTUZPEKASRY8ftlAmBUaqCPZ9NZYJBXz7eaMI5OtvpgflQNgQcOnCtdDtMR
         aLXL1/mViHyQ/Eiw6q5l74M6lxJI2lDVwav808Bt0vH3lHVFdvCbC8hyWM7pNEVb+nxg
         ruavC6k2FIFLlbVCiI4GSQvzZUEQMj4E3+FdwYVWRyCmnYQSz3rnTTs+WZDkBrTAjnEH
         j9aEOlTJ90mMjv8qCualjKQW0Sc52XVM0bPss2qOZdULBEf5bgc37vUzsfURYDbqJRdi
         lt5WyXJeF087ayjeHvz0JxhdkkiU+Wrogj1Xh1PcUncRu30t5Hi96mwsmAOfVSnUBfjO
         H6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356387; x=1763961187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLj68r+HP4hgUScOTww7dJJLSGhpNeyhKtXx00Sgp90=;
        b=dqZfVeSMZVFP1L8fM3j8r3Amwfdf6r+WlZpiuxmvcWBUlx1e3SI1uR+1QN+R7SYWse
         PieeAPEXf/sPwNS4yY11c47IfpgO6WC/LzUk5Jw53m8x2JeDoEujMEwgi74kJmPwFTWg
         GETJRtZPrn1UjuTaX4HDp4LqbRVzjj6YmTzMCDC4bvJPYn7qjrCx+E3NcelxalBUxZ61
         cmh3iVOCBn63pK3hh7PtpyQu5JDIXYqojJqRjjAQM9Mzei99NUGlTZpwW5EjZ4nGbctk
         w/ilxxjrNzsioqRWowyZaSomp2Y0c+awcWc1//omjKez7ykLb7kz/vSDqSWnHIFtbfKC
         8tfg==
X-Forwarded-Encrypted: i=1; AJvYcCWuWHpEmHbxkpoDkfhxs35BYw7A0GRc6TUT7dggkWQ1gydAW/dnQxRMFtVdJWa8lneeeZ/pUXzl2mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3RIe6J06qwEaTwTTmAhf3ps0L9FpTpTc5i2+5KkStRU79+BF
	la32HM06lOnG/uISzGIeJ9K4UvPQZep93zYkjdTqDxeibwc75YTG4YjIGKMpAYQIPZZXnxnc9Ea
	fcjQXPUxiJmjEr+Enu/LPstRuxvHp+34=
X-Gm-Gg: ASbGncsCEQn98DeRDI3Jjr6TVjVCGg7EHwV1Ip5JUOtTOTuJietxSFAqJHQv+/Q8Ugq
	IK/RA8eGQlTeoBF2mm1lLISsp5YJQKNuTHTxEuqtmtaBMQ6h7UHRb8A17PD90rIC69O7kNYU9Xv
	bqCz95iMt9JMzpsjwc1SHlzuawKtssMB8B4sODmlFM6HeNgBTV2in2hCSq/gSlo+ts0wOWTs1fB
	1kIZRiycASSXhWyuwiG0e3QsVAymhb8P6e1Np6jBrjiyNfa9d6VP19Z8M5sc/FAEv1gvjDCqOy8
	oiDhcQ==
X-Google-Smtp-Source: AGHT+IHYFghBSZFHmg6O2CoSdakpSASZQH8y1KtfV6zUprIfSEAkNUdFA1XHmtb3qEKkdJWZ+4jISl4bCapTnv5VeFg=
X-Received: by 2002:a17:907:3fa4:b0:b73:8bcd:66f8 with SMTP id
 a640c23a62f3a-b738bcd699dmr567086266b.10.1763356386591; Sun, 16 Nov 2025
 21:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202511130032.gevVvSte-lkp@intel.com> <20251116091814.1791491-1-kezijie@leap-io-kernel.com>
In-Reply-To: <20251116091814.1791491-1-kezijie@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 17 Nov 2025 13:12:30 +0800
X-Gm-Features: AWmQ_bnbCq3uOtooE_uSC0FVfKMBtGZwP_OvHk9hWJwPAbpDxFZYmq6gFnpNMOw
Message-ID: <CAJy-Am=rhawqy--q_2dmbwKteiAneTsLUZiJHVg21mrozGjzdg@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_CN: scsi: fix wrong reference to Configure.help
To: ke zijie <kezijie@leap-io-kernel.com>
Cc: lkp@intel.com, alexs@kernel.org, doubled@leap-io-kernel.com, 
	linux-doc@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ke zijie <kezijie@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8816=
=E6=97=A5=E5=91=A8=E6=97=A5 17:18=E5=86=99=E9=81=93=EF=BC=9A
>
> 0day CI reported that scsi_mid_low_api.rst references a file
> Documentation/Configure.help, which has been removed long ago.
>
> The documentation text should wrap this filename in Sphinx literal
> markup (`` ``) and avoid producing a broken file reference.
>
> This patch fixes the incorrect reference.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511130032.gevVvSte-lkp@i=
ntel.com/
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> ---
>  Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst b=
/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> index f701945a1b1c..30ac3bb5b57c 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> @@ -1144,7 +1144,7 @@ struct scsi_host_template::use_new_eh_code=E6=A0=87=
=E5=BF=97
>  =E4=B9=9F=E5=B7=B2=E7=BB=8F=E8=A2=AB=E7=A7=BB=E9=99=A4=E3=80=82
>
>  =E5=9C=A8Linux=E5=86=85=E6=A0=B82.4=E4=B8=AD=EF=BC=8CSCSI=E5=AD=90=E7=B3=
=BB=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E4=B8=8E=E5=85=B6=
=E4=BB=96Linux=E5=AD=90=E7=B3=BB
> -=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E9=9B=86=E4=B8=AD=
=E5=AD=98=E6=94=BE=E5=9C=A8Documentation/Configure.help
> +=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E9=9B=86=E4=B8=AD=
=E5=AD=98=E6=94=BE=E5=9C=A8 ``Documentation/Configure.help``

The warning still exists after picked this patch. and also there are
couple reference issues in Documention dir
Could you like to fix them too?
Please send out your patches as a whole thread.

Warning: Documentation/doc-guide/parse-headers.rst references a file
that doesn't exist: Documentation/userspace-api/media/Makefile
Warning: Documentation/hwmon/g762.rst references a file that doesn't
exist: Documentation/devicetree/bindings/hwmon/g762.txt
Warning: Documentation/trace/rv/da_monitor_instrumentation.rst
references a file that doesn't exist:
Documentation/trace/rv/da_monitor_synthesis.rst
Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst
references a file that doesn't exist:
Documentation/userspace-api/media/Makefile
Warning: Documentation/translations/ja_JP/SubmittingPatches references
a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
Warning: Documentation/translations/ja_JP/process/submit-checklist.rst
references a file that doesn't exist:
Documentation/translations/ja_JP/SubmitChecklist
Warning: Documentation/translations/zh_CN/admin-guide/README.rst
references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rs=
t
references a file that doesn't exist:
Documentation/dev-tools/gdb-kernel-debugging.rst
Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst
references a file that doesn't exist:
Documentation/userspace-api/media/Makefile
Warning: Documentation/translations/zh_CN/how-to.rst references a file
that doesn't exist: Documentation/xxx/xxx.rst
Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
references a file that doesn't exist: Documentation/Configure.help
Warning: Documentation/translations/zh_TW/admin-guide/README.rst
references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rs=
t
references a file that doesn't exist:
Documentation/dev-tools/gdb-kernel-debugging.rst

thanks
Alex
>  =E6=96=87=E4=BB=B6=E4=B8=AD=E3=80=82=E5=9C=A8Linux=E5=86=85=E6=A0=B82.6=
=E4=B8=AD=EF=BC=8CSCSI=E5=AD=90=E7=B3=BB=E7=BB=9F=E6=8B=A5=E6=9C=89=E7=8B=
=AC=E7=AB=8B=E7=9A=84=E9=85=8D=E7=BD=AE=E6=96=87
>  =E4=BB=B6drivers/scsi/Kconfig=EF=BC=88=E4=BD=93=E7=A7=AF=E6=9B=B4=E5=B0=
=8F=EF=BC=89=EF=BC=8C=E5=90=8C=E6=97=B6=E5=8C=85=E5=90=AB=E9=85=8D=E7=BD=AE=
=E4=BF=A1=E6=81=AF
>  =E4=B8=8E=E5=B8=AE=E5=8A=A9=E4=BF=A1=E6=81=AF=E3=80=82
> --
> 2.25.1
>
