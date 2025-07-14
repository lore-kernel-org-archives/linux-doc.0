Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E720966B
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489774; cv=none; b=A55PSxfaiPHOuR07UV9RFTZgeb5QsWGZf+AX3gIIDcwp+7SpQsW7lQsDjRNrOUKrXHv4FvThAFUdpqLUdDcUMWIUkVFJ8UyqtZFmEVm9r6GBFukot2seLdFnqCbxAhm+HZi1hPeYLl4CnvQO6NnVHzt/z19mwRHDrIvtVCj3Ud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489774; c=relaxed/simple;
	bh=pOwZocc5U27IQ1K3j4WIEbbeJRHaotXUiYuFjtk7q74=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sWw23hvJqPRRBya4ywTttiDVrZVCxSdPJqOP9C7uk+VHaprxxSSMozipA9l73dO+cDLqDp0AaTXPqdedoDgjS1+rzo18R8a7zm6EjH9O+rJ3LLR27Qvqijn8ahUciCRbahepjGkMPKCnrGP+gZ6n/Q35O6wVmSmLFwcAKM/Y3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgGmBzHq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgGmBzHq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so51926615ad.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752489772; x=1753094572; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mDswA8qysqZi4LTsNVjbG1RQ9xmYLTPeENsduJ1ak4=;
        b=AgGmBzHqyQ4oCV1FN5XeIoaJN7j50HB3d0KQYpED9aW67SvRG+SdG76+l+DOkPRZSi
         Tl0jkq6Oq05qjmDBz9o+izaJLfhj1lirBlkSL4Pb+sQLYCvbB46nstBA1kQ4tQz/Zi32
         +J8KADcpghNpCoKH8FlNXHSGGfIroT4AXPRiDVU42Ipcw5b5fNOvRmKvc1prVTRl4Yk4
         YLrUxXvzdTBVmssqF2ngm4T2kKaoDLsqoDmeZcFwAC5JjoWONNN18oZnR8j0QDucFKwo
         JYFnucoLUD6v/lJROwti07QvqQQ9kswRcU6J2MghFZ4e7EJUGE7PF8Ka3nWv7BguwR9Q
         iEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489772; x=1753094572;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mDswA8qysqZi4LTsNVjbG1RQ9xmYLTPeENsduJ1ak4=;
        b=RPlg4Lvo+bPI2nmwSvYQQjW33tPzKTv9v3Jg8ucgvP2lTOsb+skPofAJrTaCGYPyFu
         G55p0YJFQq8dpcMqaF+LBrnnzdY6K7cFjtfDMsP5I50hwNp4RCTUL/kcxMd/0TD/glv0
         O5bm1FK5OzfEkaXsJopR3Zsdx2WOYkyIVZ7CS8HcNjVltYifSJOzvRJE4M2ZwsW+tjwo
         Ixm6V7mUDveP8PsvcA7L5PLh+2wzt6/dNo6dsG5V1xlCBifeVgXAxpA6k27ly4QMrjxC
         jkS8abLEBIXtGtRX1ZC33DCYj/yQVSD4HFYS/tCOey9j3/NRLBxXUn9rptXerLZI4aCH
         goFg==
X-Gm-Message-State: AOJu0Yz5rfYqkWQqhzVqxLcwQY2rsf97D4RlN31+XUeDq1GyLDuc5jGf
	kT+9X5VOq9Ly89sKUNzURdm6Xa9QCP4Yrap4UXutqc5tgpl7WdvzmcPs
X-Gm-Gg: ASbGncsGhl5c8f/cytp70FWHXAK1LE5CslJi4dt2R1ZnRw7GEX3J9UFea/CybdZkVaq
	sMfZiDeJ+qYOZHFUCBNfZS6wNzfF8j+4/I9enL3qQBr1++U550QN98L6vwLRZvMaWdPeI+Nndzw
	06pL3qpYVmso5tQJtjWWwr+MRzFzoEkTTUQ4voCwOPCihGk/NNNQh/zLCMjFLTt5vZ12lp4m7Mu
	mjrewSB5oQX/sHpCp8U6viC9nQRY8jOSq5xMOWu+9g/YLFoJ/rGW1DYP6EYo1FnG9zYYkdKDWdS
	4B43ImdQFp7HZjBaCx2whxkxg2UjBG/wJExcBIjROL4QHLU7fsv9tdTxVPKdpKmTdxukRqMydFi
	VIevJ5bKIKcpju2Ie9dAlquOOjh9u91Vfo49AV09Nn5f6QvBkNPg5nKOZD6KBKy3bO6zP
X-Google-Smtp-Source: AGHT+IGNGI+HTBV7YVGZ3VwO2RLXcgw7GqpqZdyWp1Q5md5d+yKUWHUw6pu4QrkTRBopy9gOShvZqQ==
X-Received: by 2002:a17:903:1b44:b0:234:8f5d:e3bd with SMTP id d9443c01a7336-23dee263458mr231079985ad.39.1752489772045;
        Mon, 14 Jul 2025 03:42:52 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad27fsm90084695ad.57.2025.07.14.03.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:42:51 -0700 (PDT)
Message-ID: <c174f7c5-ec21-4eae-b1c3-f643cca90d9d@gmail.com>
Date: Mon, 14 Jul 2025 19:42:49 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Performance Regression since v6.15] empty docs build with O= option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Here is a follow-up to my message at:
https://lore.kernel.org/d12fb63e-b346-4094-b9d6-aa6823aea541@gmail.com/

Quoting relevant parts for your convenience:

Akira wrote:
> As a matter of fact, I'm seeing weird performance regression of empty
> documentation builds when the O=<somedir> option is used.
>
> It appeared in v6.15, which has your conversion of get_abi.pl into
> get_abi.py.  Will send a report once the time-consuming bisection
> completes.

Answer to Mauro's question at:
https://lore.kernel.org/20250711130446.1b761538@foz.lan/

Mauro wrote:
> Did you try with docs-next instead? I remember Jon caught one
> issue causing the doctree cache to expire. Can't remember if this
> was on 6.15 or at docs-next, but the fixes should be applied there.

Jon's complaint at https://lore.kernel.org/87frfsdfgc.fsf@trenco.lwn.net/
was against Mauro's v2 series.

Jon has applied the v3 series with the issue fixed at:
https://lore.kernel.org/cover.1750571906.git.mchehab+huawei@kernel.org/

, so the issue has never been in docs-next.

I'm not a python person and bisection is all I could do.

TL;DR

2nd run of "make O=$HOME/output htmldocs" takes much longer since kernel
release v6.15.

2nd run is an empty build and should finish in a matter of 10 seconds.

"make htmldocs" without the O= option doesn't show this symptom.

Here is a summary table.

Note:
    Numbers shown as (x) [y] mean 2nd "make O=$HOME/output htmldocs" run
    takes x seconds, while 2nd "make htmldocs" run takes y seconds
    (rounded up).

       ----------------------------------------
Sphinx      8.2.3 venv       8.1.3     7.2.6 
       ------------------- --------- ----------
Distro    f42      noble      f42      noble 
       --------- --------- --------- ----------
Good   (13) [13] (16) [16] ( 6) [ 6] (  9) [ 9] v6.14
Bad            ---         (72) [ 6] (349) [11] v6.15
Bad            ---         (72) [ 6] (365) [11] v6.16-rc1 + [1]
Bad            ---         (72) [ 7] (342) [10] docs-next (2025.07.11) + [1]
Bad    (77) [14] (82) [15] (73) [ 8] (347) [11] docs-next (2025.07.11) + [1,2,3]
       --------- --------- --------- ----------

[1]: cherry-pick 553ab30a1810 ("Documentation: nouveau: Update GSP message
     queue kernel-doc reference"), to suppress noise of error handling within
     Sphinx.
[2]: Mauro's ynl series v9 at https://lore.kernel.org/cover.1752076293.git.mchehab+huawei@kernel.org/
     (14/13 applied)
[3]: Jon's kdoc series v2 at https://lore.kernel.org/20250710233142.246524-1-corbet@lwn.net/
     (12/12 as is)

f42: python 3.13.5, noble: 3.12.3

* Bisection result

Sphinx 8.2.3 (venv) on top of ubuntu:noble (python 3.12.3):

Last good commit:
(16) 6b48bea16848 ("scripts/get_abi.py: add support for symbol search")

First bad commit:
(48) 9d7ec8867960 ("docs: use get_abi.py for ABI generation")

Merged into Jon's docs-mw branch at:
(82) 1ce8294cfefb ("Merge branch 'mauro' into docs-mw")

Pre merge commits of 1ce8294cfefb:
(15) 2b087edf588c ("docs/zh_CN: Add secrets index Chinese translation")
(82) 1c7e66bc5d20 ("scripts/get_abi.pl: drop now obsoleted script")

Again, The numbers enclosed in () indicate the elapsed times (in seconds,
rounded up) of 2nd "make O=$HOME/output htmldocs" runs.

Sphinx 8.2.3 takes longer than 8.1.3 for empty builds, but it is likely
an independent issue on Sphinx side.

Mauro, I'd like you to have a look into this regression.

        Thanks, Akira




