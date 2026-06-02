Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7F3D0C00
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393181; cv=none; b=cd7c0iKWIKSvQTx8gMIqd60xc4F3beU6LYxFB+e2If/50LXhwEgGfgj7SUeilA8cNJuNV7NcnUozacENIji88RJvBbZbCNf4PG2bwuLqsujSVDgqXfJ4I5h8Oiwq/fyrN5VrMszuvAVXJJD3N03cXPDeisWpaB4nMGMy7wlnz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393181; c=relaxed/simple;
	bh=GOzeMM/JYZgIe4dUI3JUkqJJ3BRhMV07ewJVU/ufUE8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qNs2R0oAzF0dVb5iOiqwwOX9Bc2qZcs+6DBcUEjS/wNTc0iJgNjIOiVqzUq7gcdUtpw263mUxxWWrQ+1qctr1aPFmWauvHt5+EKJtzvXBMGqrMl3Ax67HgCxepQHlhYtfoDzoewJve9UhIF/ROsiRHfNUK6020z7gVej+9Qn6N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUqLggyb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUqLggyb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490a767521dso1462535e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780393178; x=1780997978; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFpS2S2szfARI+N80dvWwk9HISbdYk0AgMvzITAGi74=;
        b=rUqLggybwKtGh0VgM6kLsnHJT3p5kMIHC5ctviq+udh4FHdbDqlPQzC2zlQEQ3U732
         v/yRaFx2JfY/Kk4+D39vEy9aN+wVYRXS5H72lLQCdBwmj43Q8QfbfbaQdkiV+MtoPcQ1
         eoQKUfrRq0z86aBax7HB+XQulIUm9wYvsbp5GqVrmxMpyXt3hg+kbxup1ePJZEGGX6cv
         Uy1AelfNPcMpMcf1h5m3LbVFFcWcQ0jLE1fwGmB6lIqAjkt+PD/UKYNPzSYn7MZbk1lo
         lMWXNqp4YYD1jOTss2sZ01M6+kq6rd6kGGRBSNa3D61FsFBbkHfvluCIwEmfBnRxIrBm
         DTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393178; x=1780997978;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFpS2S2szfARI+N80dvWwk9HISbdYk0AgMvzITAGi74=;
        b=PujIREit0ywQAjVams0J4609s42b2aRDOShnM5o/MEZcNEE/ceqn/MmasQ/06LVW2T
         zkG+LP/h+ri5Dgz4CJNU5yFzXHNCnYG3Qfxvh+05SvX8GzFudm4Bsd/KfTnvHn57tkJZ
         Am4ig+c0/MiPtyc5gBHCP//WlStMowraytEIPJrNfYsyMLGPG3cQcxIqB0dnvUdqcvf4
         uFgUimoGNmWyUvaKULVn5yQaxF6dPlwwNcSz+zqLGvDxT1aEMXQUB6IcVztNcbAECUVU
         eqKG6zIbS0xW1KtovaRum0ppJ8/HEPv4DZhPK/d5J7WAYEDmCqsrt4fsQJmyJ69Yijfz
         42YA==
X-Forwarded-Encrypted: i=1; AFNElJ80SnnusDLlqtRBtp3xUirTHGsBuSqGzehj1aCFNPt29WbZ+bXaNr5iCl9OoN8FWu8kpJss8Tt49+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgOLtYP3KrBjMb0JqTWqXC8VgETh313WUr/xaIslAH9Evs2I+
	JYhie9JV/kYCz2W3zr1SdDdRe4fOe/ifQiPmuLL0l0wn7ajoup961c9PUL59ykNGM6BM
X-Gm-Gg: Acq92OHK+BmOEPZ5+5VzRi4MYvC2ZLlgjkx9fCCd3p8fPFv4P2lGePs5TLn0mvMj3jR
	N2bl5PXHsn3p+KHmW4aEl1gFLgq9nvimMzf4w+vsxerJbbuCQQu6InSBQYoKpZkfp7W7oTmcjv3
	/gzZAyMOsI5pFLrlCY0zECBy833KUvHAZovSYjH3fsTXlvtOGlLF1Ep8lxIM2VYsz7qwQKkHD9H
	mV+EoFPGPj6fSwmKFJf6SOYJGJTCogxnFY7+kpHWDuJvunjfUZVOTUk4gtYMGdZwmhKS2mPIRVw
	FoFrU0cmjFVUWWoL0Iz8nxdn473yyiZFzBbsNXXDNC9O9lj+RX9f9uH/5bWrwuj7v9eCzaOZr7K
	n0DGcxZEXWGgL7yvD5A56bdAohPsNADZD4LbgFtNO5w9j7uhkBCS+smXaFGYSJ9GUs0NkR8y0YU
	HRYq0/xVWnf1InwVLZdZHHUVf9rIXXu392AMczEAzAMm/GaRHjvgGqDZSi4rDtwth44goc114=
X-Received: by 2002:a05:600c:1d0c:b0:490:6e0f:2a10 with SMTP id 5b1f17b1804b1-490a294a76amr99880005e9.7.1780393177806;
        Tue, 02 Jun 2026 02:39:37 -0700 (PDT)
Received: from localhost (32.red-80-39-29.staticip.rima-tde.net. [80.39.29.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76feasm53722455e9.9.2026.06.02.02.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:39:37 -0700 (PDT)
Message-ID: <25667a7c-e426-413d-aa3d-a52ebbeb9de5@gmail.com>
Date: Tue, 2 Jun 2026 11:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, en-GB, es-ES
To: Jonathan Corbet <corbet@lwn.net>, DOC ML <linux-doc@vger.kernel.org>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [linux] Documentation/arch/sparc/oradax/dax-hv-api.txt and
 Documentation/driver-api/parport-lowlevel.rst : Form feed (^L) characters
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed that  Documentation/arch/sparc/oradax/dax-hv-api.txt and
Documentation/driver-api/parport-lowlevel.rst contains several
legacy form feed (\f, ^L) characters used as page breaks.

I am not sure if these are still required for any specific formatting
reasons or if they should be removed.

They appear in the following lines:

$ grep -n -P '\f' Documentation/arch/sparc/oradax/dax-hv-api.txt Documentation/driver-api/parport-lowlevel.rst
./Documentation/arch/sparc/oradax/dax-hv-api.txt:66:
                                                                                                  Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:128:
                                                                                          Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:176:
                                                                                          Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:228:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:284:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:342:
                                                                                                    Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:397:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:454:
                                                                              Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:504:
                                                                             Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:554:
                                                                                                      Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:609:
                                                                                             Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:667:
                                                                              Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:719:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:779:
                                                                              Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:830:
                                                                                                    Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:887:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:943:
                                                                                                Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:995:
                                                                                            Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1048:
                                                                                                   Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1105:
                                                                                             Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1156:
                                                                                                    Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1216:
                                                                               Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1272:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1326:
                                                                                                    Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1381:
                                                                                                     Coprocessor services
./Documentation/arch/sparc/oradax/dax-hv-api.txt:1433:

./Documentation/driver-api/parport-lowlevel.rst:104:

./Documentation/driver-api/parport-lowlevel.rst:504:

./Documentation/driver-api/parport-lowlevel.rst:540:

./Documentation/driver-api/parport-lowlevel.rst:586:

./Documentation/driver-api/parport-lowlevel.rst:674:

./Documentation/driver-api/parport-lowlevel.rst:709:

./Documentation/driver-api/parport-lowlevel.rst:866:

./Documentation/driver-api/parport-lowlevel.rst:1102:

./Documentation/driver-api/parport-lowlevel.rst:1188:

./Documentation/driver-api/parport-lowlevel.rst:1217:

./Documentation/driver-api/parport-lowlevel.rst:1253:

./Documentation/driver-api/parport-lowlevel.rst:1282:

./Documentation/driver-api/parport-lowlevel.rst:1319:

./Documentation/driver-api/parport-lowlevel.rst:1355:

./Documentation/driver-api/parport-lowlevel.rst:1386:

./Documentation/driver-api/parport-lowlevel.rst:1413:

./Documentation/driver-api/parport-lowlevel.rst:1444:

./Documentation/driver-api/parport-lowlevel.rst:1511:

./Documentation/driver-api/parport-lowlevel.rst:1589:

./Documentation/driver-api/parport-lowlevel.rst:1629:

./Documentation/driver-api/parport-lowlevel.rst:1661:

./Documentation/driver-api/parport-lowlevel.rst:1771:

./Documentation/driver-api/parport-lowlevel.rst:1805:
