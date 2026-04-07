Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817B1A682F
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600804; cv=pass; b=BiDBVOSxxHXfQddXBghptFCskcXCkfhzhQEZf0Etn5grc38IYLdCk437rcjNjU3zBcEK8gOe7SSE64hHTWcZBK3QbKImYk3yRuDyCjajZIgKMI5bor8Dg9Oi3l1g+yK6hPkyvYHrm9s7fxHVkuDqcw/XVfY+ZbywUxmGZGtZwTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600804; c=relaxed/simple;
	bh=Vp1DFZKwdKcJoOxYBzTYtf6MrYpjqzAFbRI0LDfswmE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=K3DsgUMa83Jtd+55JKS4BJLzsUjU1HrsyvDXvENS4mpA2YpJew2I8ovKfbtEsx84wpbPzLKekryOjAFPLK/M+cMt/tj8TdmKk79EBjyi54tMx5PJEF3oDRkk2NEUmFlpvYywbSdqPeAW3OAa+cPwSORxVseelDZs8DcDqISLzRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChuMavNV; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChuMavNV"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-67c250805ccso1814584eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 15:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775600802; cv=none;
        d=google.com; s=arc-20240605;
        b=Qw7j6mzWQ/8HiUX8is0zsOqt4lLIY+4uFAkRHkewK8P166q7lHMHqBy/rLt5bGTlex
         8ndVJXVWPH9kyVlfpnVzE9IOx5yaEAyM1C4522gw1jyyhnisqD1h+Le8MUGZbYJDafr7
         ysJyCt/EF8ZgTQZkQbLNSs2ZQvlzn5AcRTLs/WIin88EA3VxWpU7kEuDdPo7KrDcBcqa
         rpbZ3qB/w4j/jX7mxWxq0vJE1w0f7iZZQBfb6bLi1MFr4uZhdwmsqg/oyT/QWYpEvq7z
         TzZ/g11e8gEi4IvtacFDsxJoQrMlsQMd72Qz8ghQ5cA6bkS9SqlTIOsTEmER8Yq2e4p6
         VgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Vp1DFZKwdKcJoOxYBzTYtf6MrYpjqzAFbRI0LDfswmE=;
        fh=EI6d71OGmtydvCftwdZAYbT4PhjRy72g/Nzs9MIih8s=;
        b=eljbiehyoQ4QuTjyhDMBL8wuogYKvW6KlQTnnyOic8aXRBq+TgIM3F3exSKkq6dj/s
         1f4/dIltsy7XkYc9Yd8L3bXaUx3avXeL+pvJeAC5Mk2q/ioPhEkxYgyDcNzyeDBSFnMa
         s9uxBDFRA1Imkma86Iz4kFqhxByX2lHGISFijqYoT6eFcLr2rasWVlNkYb6d37Y04ZK/
         M9ZXdUQdhPIyQZpwp/lP4RdVFBfiF4nNaYAL3GkieO6a1/utj781u4oPGwTuJJQhPcOa
         sJ9OYgBlSBoLaEoGaKuJjINDz4lG0sQhB6Qc3mplYNlPQ5mnWSKXAuoz0E6iaXqYI778
         DYmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775600802; x=1776205602; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vp1DFZKwdKcJoOxYBzTYtf6MrYpjqzAFbRI0LDfswmE=;
        b=ChuMavNVvpvp1zhnWk/+StoiVFgAXCiYdwnB/0Gb542K+x4rnm2D8MhYh+TH4SBnEX
         RztP45bxQFw0bTKDlIiwWH9V9X0s59QWcCo84/U4FIlrWuyNL3VXEz69pN4TrxmVkjxN
         CEt/m/ueP0MKmGP3WbbuWXWxM9mav8GUPq/pu2tned535Mfx1WrBWVMJb8SLCosL6Aml
         5hdjcll+am9TZSF6T2ZNN88esGV+V1Xkjk+uLImT8RutRawlsU7HoOxrhVb4q0MAZrkw
         HW9P/TvUJ7TWCAzQaEGseUkHq+aZtY86sntwYFcJbcznNEpmfKatPefY2irAqB9t+4d8
         jatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775600802; x=1776205602;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp1DFZKwdKcJoOxYBzTYtf6MrYpjqzAFbRI0LDfswmE=;
        b=QhkIKoTdVAg+HFtQpn3GgCSs2LfcSagg1z5Fa7fqLOwf0aPJU31BOj6eo6A7IQjVVe
         nopa4TzM9z+OTKOwzQl/CkGDMKsyT5AbIt9K+k7zdIUFjjAKKBkePCKxKeW4XIf2a3d5
         ug9B2rR4aZcbnVBv42jMimy9tuAFWkh5sUCvpPUXBI0g66wdHmtadc7FU9Y7iEHstMCz
         mRc9d5bWQPYkmYmlBQN+9vHhxdsYAuGWoWebNZk9xxotoyrLq07WlYnW7bTOQZS7Mn7M
         fZioFPa8Ty0bskHYe3/ySb/OM4+dBe1a2Px74xlrHcYiwo2hvoKD2bGwxGbRGhfnuhij
         rBtw==
X-Forwarded-Encrypted: i=1; AJvYcCWEfjPdc7ZElfTBtvs0TogLX5vifW2tomMtgESOVgq5EBTssNQOCf3I67W/LOQ13Ne6d+XwSwuUKlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFx2G68xYgEqQzMcitInOPpsCY7Bd9REBRF51VIzmp1U22oD/
	PGP1iD/KYkDN4KpVF5p3Cy+DMfPk7J7fPIV//tWSjT6T/77slcjnCQpRVIB6RDxeL5aOfA2yq9M
	I4MKnXqWx3PeYOZWKT5spSuS2lKW/aysDxiyS
X-Gm-Gg: AeBDiesNrRzwjjrUrpBL/cTBt2wOPMaqR7vGQU7FLab03xlXZ24W3ixSVq4s7fzTagp
	4zRWlHfT+Q4ry9SB77LhrF4oEzYkDyoKZSpDWs1SnyFPXr51aSDZKJVuAMNjpa3U6SNpqf2uGF7
	/yRo2yMnNFLOlIqjEumF0iLTAP/LkvzB6HcmPe/TiX+a1G3h+EeNbsLteVRueNpZO16TT1TgGtf
	S0H4BBXbn/ooCv6seSImIy+o5vvy0CAHpQZfuX5VVA2m5HAq2+z0quiX4biSFigfqtbbOEu9POb
	EyolWj+OUdJcIu1xn6OHqholMY1Ifpx3G0AvOl7sy6zFNGRl6OaYfwqi9JJUYtQcCTV/N5aYdg=
	=
X-Received: by 2002:a05:6820:f001:b0:67c:2af2:a65b with SMTP id
 006d021491bc7-6821d237d7fmr10460423eaf.9.1775600802034; Tue, 07 Apr 2026
 15:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 7 Apr 2026 19:26:31 -0300
X-Gm-Features: AQROBzDflMsQytC7nlNh5NcoOcAKMxNgNBEC0_Yzsy9pO_DO5FeR46Pap7kTy54
Message-ID: <CAMAsx6dF=FH7+DHK5+s6z8dc197ATn-seG7ZYYeUbcRb8xsuqg@mail.gmail.com>
Subject: [PATCH v2 0/5] Disregard patch series - docs: pt_BR: Complete PGP
 maintainer guide
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jhonatan,

To keep my recent contribution more organized, please disregard the
patch series I sent a few days ago: [PATCH v2 0/5] docs: pt_BR:
Complete PGP maintainer guide translation. I will be sending a single,
consolidated patch in a few days instead.

Thanks!
