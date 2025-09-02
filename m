Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B42D5C8B
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828604; cv=none; b=D+iHYEe9qmFp37YCgYpxMNA+0vw1qGCcyO2W5fw3epXlI//euMrcqpk3jixpdvcYxr9gN0bIW0Tnhwn4W5Fsh1GLsI3vVjNCPftQBoKWPOvvr9FDBO7o2UpucPAIv3MdE419RdKA0koKQw4slPUMjBfk4Bpi8mxRiy2rAN/erkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828604; c=relaxed/simple;
	bh=UHlUNcL2RVDK2q+nSIlFfmEZaxPuNmoZ640IPjeYkhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6tkB3G3nCh2IrdJkt3nCCzKWxxmT4X6VjfNB/aGw0hslpB5Q23/Zu+/fkoxQjXhsZ0qkyGjYGb0nIYXNEAOxalwkKpSYaYN9nIfGMTqo05dpNfz4hKTpQaxj84Erl8ef0iiuepSqZGXhiDxzQv+DBblh3Rsi3DylZiOy61RhRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOeWyW4y; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOeWyW4y"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61ebe5204c2so1242357a12.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828601; x=1757433401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K8dFUaGywEGKT+JX9CeQ1sbqRE7FdFpfcuiuyVf5rs4=;
        b=AOeWyW4yPFIJctSr9oka6f7rUZMITBbQv/54Pv9xln4TtRRGtI5L6LANnPLv8NK1Vs
         q1T7TMVkpDFp0chIi9+EZpODL785o0j8UL2WwdgF7prskAkklk6bAS2r4gtf2kW/52nH
         jz3gZZ+0wiOoSY5Ccyv8SJaMCf3zmXwMyPlC4ORLx1bsLftiqRO6tmqJ6CHsJHM79Q0V
         RHRFw5PjeHXNTBpWTExhDGbJ5HN+Wg7lco8HR7+LMtGE4CaFSQS5ebGqJPMsDJhW+gHR
         RSjjDCepip/dRPuLFhUDHhFfhgIhqKHX68b7dErRFhfYs48+8rFL0ZFM+rAmIzdNsOvo
         6acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828601; x=1757433401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8dFUaGywEGKT+JX9CeQ1sbqRE7FdFpfcuiuyVf5rs4=;
        b=mTKLbLoQqMk1MLTwONMjOj5pZ5PMZjw4e5u2l/DNo5DxhMR+PmT2lgRL3fmE2nt44I
         joStLFHHodXCqfbGZEg5TU89co1tWfH+a5OM+YTNH81JDH7RZkOvO1pLjfqBiA1XtRQS
         udhXI7LGfTdlT76GzKoIDTtZ+JEgSTD0JtrHB/kjM6EQpzyEtcsK8mwYpRroj6brm6Y6
         0x0SV8Q2ERUKq5tjRsf/sfEFcK28+yQl7wQM5CTAGSr6U2MUemMK39355BxV1YJHgddA
         KExb4auCOqNEqpiACsQMY22bVmSIZcvAQbh/4/J4Fp3e++aFu4xBfWiQ15VzmD8X8auw
         KaXQ==
X-Gm-Message-State: AOJu0Yz8vkPJGQiW2hWuqDmV40OwpDaewMYtm9RTyyDPdJGBJD00mdDi
	KJ+uLeQOQowm9WPJTyuHY4+j19rE5Uf7H28OGQDu2MBF8Sqm2jjyCP3zaOhIEeMo1oQBvKR7+8Z
	bvaQERRWcW15AmXvTPZzgABLgzCq1iflImTDtS/M=
X-Gm-Gg: ASbGncs2krH0czOJKgJHFzuAT+Ut5gUwlfSu3fFQCbgFJRkmUgF/hqGy40BMVQzHCWj
	9SIFTdkvoMn6pjxLBN4SkidGV9ac0dogAfvDm8/J5V5Oago3C6xynkIBTOO/a4Kef6ZRljtqFpB
	inWAQAg0lIvevCl22lrp7QYBv9sjWajnYXzJWL17Ez1aUyw6/oyQi47W2JUBcYq9NAbzkLdjQIj
	JVTVTQhAp9MldinO+w=
X-Google-Smtp-Source: AGHT+IFhe0fpc8meFYSc7ZllZNyX8wSGkEvj065UuftcjcPRZfmtHaI3v8ScUHp6dBaZokuGnY4nb0/tM4yTla49L/4=
X-Received: by 2002:a05:6402:2693:b0:61c:9cd7:e5b3 with SMTP id
 4fb4d7f45d1cf-61d26d8059bmr10052305a12.28.1756828601358; Tue, 02 Sep 2025
 08:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net>
In-Reply-To: <87a53cx4r0.fsf@trenco.lwn.net>
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Tue, 2 Sep 2025 23:56:03 +0800
X-Gm-Features: Ac12FXzKwyAhDQFK6M7gMw-yHSe5Gf4LAmQEWHuzXWO0GmNF0T-Uk8ybD9F-Td4
Message-ID: <CALMA0xaFxH_AT8PYyxLYqjP9RGKpWK4PsYbh-jVD8ddY9bCyFw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: sphinx: handle removal of utils.error_reporting
 in docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is a step in the right direction ... but the exception you report
> in the changelog is sphinx.errors.ExtensionError; why a different
> exception here?

sphinx.errors.ExtensionError is reported by sphinx, following is the
full traceback
(ModuleNotFoundError is a Built-in subclass of ImportError, which is
introduced since python 3.6):

    Traceback (most recent call last):
      File "/usr/lib/python3.12/site-packages/sphinx/registry.py",
line 541, in load_extension
        mod = import_module(extname)
              ^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib/python3.12/importlib/__init__.py", line 90, in
import_module
        return _bootstrap._gcd_import(name[level:], package, level)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
      File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
      File "<frozen importlib._bootstrap>", line 1331, in
_find_and_load_unlocked
      File "<frozen importlib._bootstrap>", line 935, in _load_unlocked
      File "<frozen importlib._bootstrap_external>", line 999, in exec_module
      File "<frozen importlib._bootstrap>", line 488, in
_call_with_frames_removed
      File "/var/tmp/portage/sys-kernel/linux-docs-6.16.4/work/linux-6.16.4/Documentation/sphinx/kernel_include.py",
line 37, in <module>
        from docutils.utils.error_reporting import SafeString, ErrorString
    ModuleNotFoundError: No module named 'docutils.utils.error_reporting'

    The above exception was the direct cause of the following exception:

    Traceback (most recent call last):
      File "/usr/lib/python3.12/site-packages/sphinx/cmd/build.py",
line 414, in build_main
        app = Sphinx(
              ^^^^^^^
      File "/usr/lib/python3.12/site-packages/sphinx/application.py",
line 291, in __init__
        self.setup_extension(extension)
      File "/usr/lib/python3.12/site-packages/sphinx/application.py",
line 489, in setup_extension
        self.registry.load_extension(self, extname)
      File "/usr/lib/python3.12/site-packages/sphinx/registry.py",
line 544, in load_extension
        raise ExtensionError(
    sphinx.errors.ExtensionError: Could not import extension
kernel_include (exception: No module named
'docutils.utils.error_reporting')

> I would still rather just look at the docutils version in any case,
> rather than trying to interpret exceptions.
>
> Thanks,
>
> jon



-- 
Z. Liu
