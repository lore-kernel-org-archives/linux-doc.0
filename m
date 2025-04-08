Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4C184524
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119824; cv=none; b=UItVtDtt4MOqs1N4wQMfXkEdLu+pfft3kJ+BQdy8WpNIe7bUIpw8encSfEHJ1QHDYc6M4KPT7sP2ew8ucoXL4KDeAs7FQ0l3W2Cp7jK40JzsfidBvbec0yItsE83Klw5V5vwK1O5IgyqjzW1vs2DeGIdGWNCCFnlyS9nf2DRyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119824; c=relaxed/simple;
	bh=x7Q9f77UAPExNnXShAc7rn+a8xamTwOyWhDUXbMwVA8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tLk43yWEoVsbQNk/IeoE4ss7mL8LSGb/Ju4AzL9lFfJ1xVoQ5SQJHtFQGuJrk0wcjX2GHPI0J58nefLt2s76vL1aMbz5+csKVczl7EmTE8BjRUnaabZZ1PMmZXsRbMv7mPT+ej7MyQs8l6zD+4Ku6qcqJSQ8t5z13m9f3iXVAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB4jrmWl; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB4jrmWl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476af5479feso54086721cf.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 06:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119821; x=1744724621; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x7Q9f77UAPExNnXShAc7rn+a8xamTwOyWhDUXbMwVA8=;
        b=BB4jrmWlLSE5gnZgq8/cvb+taBCCm8q40cs2R2ly2zNAAzcnOsYPvwoqkAlWF4DK6r
         qCCkCgyL4N99YfsLj/56FMiUj78GJygkz2amF2tdObufSf9dBRi5KYizYia8LHLjebUS
         2941GhS0+/x4KpcMfDo2MOLmzxy9/sxWntaLW2+LXcVhx4T63Q35cFzpWDU1vSTgBvwI
         IrSbeL9du+6zDFc2F9AcGDZT68YbW9Qi+DhMJAQ8A8+6olTTSkCcX6xX4BBYH1Zg+HEX
         yl2V27CaPDSDoiYrvK3+b+OPORfI5QaY4noDRKh9XLoAtrbPzlLJIUdqDeUCekG7mvhO
         gz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119821; x=1744724621;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7Q9f77UAPExNnXShAc7rn+a8xamTwOyWhDUXbMwVA8=;
        b=IJHKpkvHMdMTZc5IXS0Ua9OVilPaBEmOnXgwPY/uuQ2r+AWYSLsONMffGh3dRNUEv2
         +8yYhSaGpvvRrLVurcZtsJDXd/GFwfIhb2vHH9JsLPpoDr4wnxskWhJCQT2YNYPw2mo9
         nowxanII8h7RkfsX8WrtYtgr003eFV7iBwwyt8F4AOsvNTWRbi2qjVrdhxAwneF5p4Yq
         EeXEoPIuhGhAglOhP9bhvxqV4ezgxlijcKnRb737KJKq90Rj3u/ISikERka7gTO4keFc
         C9xtT5X64G0vBDVg+yEvkOzgJQ18BaG36aXV9cCpeNt7RaSJIxZjBix8ee9YPk1xCD8a
         GnuA==
X-Gm-Message-State: AOJu0Yw/B6bElZh16SO12vAHCVe2AgaaXr5xCzk9TiBfwBzpunBw6y7H
	QQKwRySkl7kFyDDbRY+W0w33RdGBZ8fpasWuQSbDaooRmEPB8zzHRA9baAXwgk024BKlhbhKOJP
	oF0LTw23/3YFdjsBVG1OCqMgxwrPgrk3cwL7/9g==
X-Gm-Gg: ASbGncvm5xgXdTU9tsQR46Z0r34JG7rCCAKekuOyceZVLy+sOx/FzBcKKWXlUUSR95i
	pcpCl5hH4BN9pHk30fmcO4Zd1JmNYoYjeCLhA4sT40LJQ9jnXjjok8tJuw6bj3qIXPLL1dP/Fq/
	hIMLXsIAI2/Msej0yfoA3NbYGe5nPg
X-Google-Smtp-Source: AGHT+IFwaRMcIi7I758mz+fKiXejT0QvjTsf/ZRWVn1BAXxfqCLJE/uSaP9guYD/cX9Vh/sHh0G6t9IlUodxyk90Jbw=
X-Received: by 2002:ac8:59c4:0:b0:476:a969:90c5 with SMTP id
 d75a77b69052e-47924945818mr221064301cf.24.1744119821449; Tue, 08 Apr 2025
 06:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Moumal Al-Saady <mos.alsaady1619@gmail.com>
Date: Tue, 8 Apr 2025 16:43:29 +0300
X-Gm-Features: ATxdqUHBXTxSO1bBKPec1a3MdTzyKUWQmId0v9ilOHVmN3okv0WcykiSjYrYzcQ
Message-ID: <CAJu75abi1gcn78k+srTPNOFRDsyxrgc8_uW9R0EkFxVV3S9Qww@mail.gmail.com>
Subject: X86_64: Obsolete 5 level paging config flag documentation
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
I was wondering if 29.3.2
(https://www.kernel.org/doc/html/latest/arch/x86/x86_64/5level-paging.html#enabling-5-level-paging)
should remain in the documentation, considering that from 21st of June
(https://lore.kernel.org/lkml/20240621164406.256314-1-kirill.shutemov@linux.intel.com/),
the config flag was removed, and unconditional 5 level paging support
was put in (https://www.phoronix.com/news/Linux-Unconditional-5-Level-x86).

First post, followed the FAQ, guides, please lmk if any improvements
to communication can be made. Additionally couldn't find in the
MAINTAINERS file, the maintainer for 5level_paging.rst, so directed
here.
Thanks,
