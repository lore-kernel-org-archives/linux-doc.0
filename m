Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091B52DFA25
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622436; cv=none; b=P47DiPxidNRP1Sxp5RWpGs100rbOtpnUGkgp7S6a4/uk2E8I68wnZnFgSWnKxCQHZZkbsSq9MY2jbRo66eEo8p8PF/kb3nWMtA0VlfNPvQvrLUqRroKnIsRvDMWOGUo6/mqszIBA0n3XV4JR/jAVpyxqglqRV5OF+Z4yyB9Jfiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622436; c=relaxed/simple;
	bh=4bJpBsrbzjzbRrrgEMq91qlQchbUmC5W+AX2WUbUlKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ef7GItqv9rws/jwQ02Efjo4V2xOdmVrQvkIV82ZWqrRRSIg1xH0VRJrOstO7PWHVD4yEIIoc+opucbaC/GrHzrOtoJ5SBWGu721+v8f+RdAEZq9MbrMaPmPTsjFQztNEq5l1H2IONeWKlY+RmKdzZ32UsgRzYCe7vOluT8LBrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzixPYyM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzixPYyM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-394095009beso27359371fa.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622433; x=1779227233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnfb6a8oovvxOdUoN29pJtnH+KCnEaFZiRmRFK8M/fE=;
        b=NzixPYyMyz9LCWPRtBXAcAju387YSY2ZMuvUiiUt4PAQ4//i6aLy7bYLNxK1KM+qn5
         ObQaIHe1kBi8DKd4a01q14VqRnTfdFcLKHtBvru3zQHjNkqY52DuJe0q95EssbhOsmgc
         1sSEhqwX7aDy5SvyXRiv/aQmqDpZq6rD1t/kAXH4ST5i7knuw/Ws2kHKxmRTZQXlllUY
         HgR0qOJ6VQcxpuYOac+srFb7WkefytEzs5WZNzTP3wLi8RVaYOaB6ux+0nHHX5LeSL1G
         F0bnckOJVJWnb3RoOwmVJgoSNrC23C61t0dfMjgvCe/sPapqAhrpga5C0+CaVU4yFxVM
         usJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622433; x=1779227233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnfb6a8oovvxOdUoN29pJtnH+KCnEaFZiRmRFK8M/fE=;
        b=lTgDN7wMQLI+ANRoUqsjO1RL8/XwcMknSwXP/49Nj9QCwbyNs1p8ppFjrKEBUHSQie
         zVtXzTZ9umapJObnGGpRAW9ktoywTaaA0DkOZyySGbTOOBdJ66z4ygZ6K9xGsOoeALCM
         6FRd3MTlG2nFd9Z2AWIv+caWSvUWaEI2XmqaWmp2rKi2nkG5GyuQ1flzYu88ib3X0Sat
         M+KIX7IXJLGoMX2wBWukj0jZf2r10eFGwgh41jp2yLM2obBWWPcTSRacmxOpPc82z4BA
         fgLE5OzXEgR1NqBmYFK12SMl8hkrm73V+n4KU/MabyUDyaek7ZRzzNJmCSgsUg4jnSgD
         emJA==
X-Forwarded-Encrypted: i=1; AFNElJ/zoQnPna09CpQCaO+aXyDOA62cncxycHq9WBRQQ7AukVE7xZQMZP2qEwEAxf1/LNBE7Or2lh6C0sA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtlcYFY+9PsAAMUsTAaKMDez7it92Nr5NsD/Jcso7VDj/6dmZO
	K3860oGwgURAIHLzKS1JJj0J0yNQ/TXExBJAtnalV0gdrfjDZLhYkTEM
X-Gm-Gg: Acq92OFp0urAojaHPVDd9vTPiVfwucyCdnydeFQqqAa+zhWqfBBraf9bfTIqe++LW8Z
	lLMIXUBUOsZlWifeaT9JpH9cxT4lSbCavSEYJbWnqIvxviWTCqESbM7tKGJRH482xxqhi+OO1B5
	PmYJylRS3AWrlPF9+GzJhsvvTUUxlBc1eLq4ZRLLmd+XpgFw99rxFUg+AZ0uZBORrMzIk77hQ6/
	zuEMYcRbpqLpxWF3sLCSskkTtSSxVpQI10eAau5HdP+BadX7HhAZCkM8QD5j3hkqH5JRHUie5aY
	A4eC2MwKLhZSw/t0fid8kU26KQI8DvJStx06PUZsk2VSNl5d1Sz+PanArakPkP4fonOZq041tKs
	vAlFkuDRNGOBi0v7swGqVPEz12P5LddTkxZI8SHoyxfUBvsDm/vDUNPHDNUQga/NY8taHkGfgtZ
	+AW5LYzKDxMT20JL0cz++F/xH0wZs=
X-Received: by 2002:a05:651c:3243:b0:393:cb61:1808 with SMTP id 38308e7fff4ca-3944b5eb283mr2049341fa.24.1778622433104;
        Tue, 12 May 2026 14:47:13 -0700 (PDT)
Received: from localhost ([2001:863:361:c304:f117:a539:6ce3:fb03])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6144071sm34373081fa.32.2026.05.12.14.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:47:12 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] scsi: mpt3sas: add hwmon support
Date: Tue, 12 May 2026 23:47:01 +0200
Message-ID: <20260512214703.655633-1-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the IOC and board temperature sensors of LSI / Broadcom / Avago
SAS HBAs that bind to mpt3sas through the hwmon interface. The data
lives in MPI IO Unit Page 7.

The same fields are exposed by Broadcom's userspace tooling through
the /dev/mpt[23]ctl ioctl path (typically root-only): IOCTemperature
and BoardTemperature in lsiutil; ROC and Controller in storcli.
With this driver, sensors(1) shows them unprivileged:

  $ sensors mpt3sas-pci-0200
  mpt3sas-pci-0200
  Adapter: PCI adapter
  IOC:          +42.0°C

Testing
-------

Validated across three Broadcom SAS chip generations. None of the
cards had a board sensor present, so the testing only covers the
IOC channel:

  * LSI 9500-8i / SAS3816, SAS-3:
    - hwmon device registers as "mpt3sas" with only temp1 (IOC) exposed
    - IOC reading cross-references with storcli and lsiutil
    - rmmod / modprobe cycle goes through the explicit
      unregister/register paths cleanly

  * LSI 9305-24i / SAS3224, SAS-3: same behaviour.

  * LSI 9211-4i / SAS2004, SAS-2: firmware reports both
    *TemperatureUnits = NOT_PRESENT, no hwmon device registered
    (graceful-skip path).

Sysfs reads share ioc->config_cmds.mutex with the driver's internal
Config consumers; under 8 concurrent readers the queueing wait
imposed on legitimate operations stayed below ~40 µs (SAS3816 /
SAS3224).

Not verified (no available hardware):
  * Path with both IOC and board sensors present.
  * Fahrenheit-units conversion.
  * Sub-zero readings (signed-cast path).

Louis Sautier (2):
  scsi: mpt3sas: add IO Unit Page 7 config accessor
  scsi: mpt3sas: add hwmon support

 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/mpt3sas.rst       |  57 ++++++++
 MAINTAINERS                           |   1 +
 drivers/scsi/mpt3sas/Kconfig          |   9 ++
 drivers/scsi/mpt3sas/Makefile         |   2 +
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  19 +++
 drivers/scsi/mpt3sas/mpt3sas_config.c |  36 +++++
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c  | 200 ++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c  |   6 +
 9 files changed, 331 insertions(+)
 create mode 100644 Documentation/hwmon/mpt3sas.rst
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0

