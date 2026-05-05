Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DED42B75D
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983937; cv=pass; b=StRcZ+P8a/0vm3S4cR5DEJNXf6Vqi2aFp3UbHPdInIwx0SANoA3fxaqHd2S4+g0j085aUf1S3rIIVsl0nYhW6b9VJZPL1iMxO06SoCY1PkUR0xX+A54MtDhuB269tfHjCakSz6u+gH87FzYxYJesOZYUuuaXI4NR9CHlgM8cya4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983937; c=relaxed/simple;
	bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nrh59aX98mOG321umU/KyEeq9K3pp+ArUedvJ548gdHGCkdePFYbP/gEDCKkymbFnf/nU2E7f4jNVNoUDHbZuXRlIk1vdIuDGwgU05+xHJpCATsST3RXZFCzNLUv6sxxmW8408CSdYAuJ+aNgkPhQpGsTbvN0Aje6Mc9CM7Hp70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQOU3M/j; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQOU3M/j"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c477a3278so2905554d50.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 05:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777983935; cv=none;
        d=google.com; s=arc-20240605;
        b=aKaO7vPv0l9K4mfH+4j+fx0+O4/jNnckDY5u4Wnn31JZ3CzNSN1Ik2aZo7chU0bIpj
         aiLXpJtC5T5YHnKb65iXkBQeVbiEd3cMimDitdcNIksCb80YdIoNtXzD85/wmS0opXY+
         5HyjDmDNQqAEECAFC1FMNkeBzBou7AiglDw8kcFFeXguX3SEktJaSsM6Ybxb1/aEVtUn
         xWmYz1MRcVUEND8iHYuHCnQGQhVXsxTsyDi/VQl0YqXzPh506IMCA3Asj3bX1WOqwAem
         nGBuHtpHdAax0V/DzqLFWhBD/LcLi0CcediAuENpHga3tQt7rMlqsst/OFSdujl6mZhc
         +Tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        fh=e2HeAjIQaqEw+lkY6WtLCIM9rJd1fnO6lWpnAbqQK2k=;
        b=fPQf7bn0hWbKOmxsVrkRPArPyK7sdZMBcG0aeRzMNS/J53Yzhc9Y1ueW38KbEbExWU
         OJ0wXM3/nyZhmg+jCdzFEPRhfvogdNK5J1GhAmRPrDuRlvY6Q/FFeEmZvLkItHXwOwSI
         QzNs8Gd0OqYvP0UckgJSWFggLGHEXbox2gMjnv3SQc/jGLTWHuIbp9ALo3kCb6gAldwq
         opMmGud/b5zGodtXtDT8WY0QyWJGV7dFGX05Jebc1uVCK+ZjYl3FXnmZi+5XhItpf/jH
         CRIrBUvkt0xEu9r5OZimm2xO6WRk3gA2GCgri2QbQT1yjDpFNreN4mCp/SDxl40ld4cj
         8/Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983935; x=1778588735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        b=ZQOU3M/jG+OwqxFi729qgWQmFUv+ytbhs1jBEIQar5Sq2VGaMcFgpBe3e/Zrr4sB04
         k2MCsjSWVe9m+nUGYbwADmXCg36vV3r1oVznnJSlQWENc5gKk+EJ1EWQybXccT2Uocnw
         N73ZwF76OJFX4vK+WsiFgerU4zKGQ93hRYvxMMX7nRBuDPq00sORmxXhSvtZCgXJomzP
         JL2LHIC7Y6DTQmUsS/G4mtkWIxMPswCCdO1YmJpf7ABZsVJDOr3SKCI7UTwJ7eri2Azo
         Uew5lb+uP5efwW1WAmbZX+lY0S96cfjJdSSuGT68vU/qmq7jSSmQhqJtb4zro75C9z+p
         IFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983935; x=1778588735;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        b=dx5kByXeqVt+xl/e/JyZWsybfM/2RNbIibL+tTX7Nd9rQmTGiAJPLQjnwMDPbpVD/H
         PqGhHdsWnTt20Xb7VgwJrFY/uzmVZ8QzC+ob1pqNpUxA+66IzRf+qp/53YWH2ZYvThKu
         In0ziYm5wZom3m0UaIH0y68xkyw8PSlNRcCnzU39zlf9rsap9sYWrDvLO4x/D+IwezPO
         gRZsIFzWxS3tBUdxAEpz4Td1LTZLIRs8M4e9zPbo8O/k4UoBR8cFoxbry5kGq5WS/Cw9
         6ECPBBhnvrYvCyHI+hk+c40ehc507FcOsdvEhQ46nN7SA3Wl+OG9AIvV2G3Mgwxw4QDg
         nVgw==
X-Forwarded-Encrypted: i=1; AFNElJ8+Pl1KUs3hoxWOmFSQtv+AmRrg0CfkiBtAq3Fk+xQpnbvEpKK+QDPmJRO5piczqsIyTUp20hfkw8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgucQsOBxVuPli3lvyStZp8ptNV3dGWvr02U4/3ltwmxxWfpyj
	u+M3itEjElfMjGtQ89Y5OXL6fG2w4/XZFd+7LrvO+WTsD91Ng4GTIo/zRZlFVa+d0adNlD+GQib
	LATM0Zt3X8iCfynK5qQe3NF/69Oh1fA11p1CfDb0=
X-Gm-Gg: AeBDies1v3XvUymB0uye7mddrNcF7lTxt1S6cOAUgNY7KCF1cEAcXgPmD3aqJmnK2XN
	lFGJ8pZYqQreSZCDOiexjdIwd3lHMjECey8jaXta+xvzpyI0cLDU2SyDfaVLA7lpNhKtn9AXLDk
	s3mN13cfgePHf1wjCYqRvVSbxt7CgnF6kpo3BRwBih3o+U62jOXtrxgByrFK0xm+UMsjTsTVrjt
	YHrYCvGeW/7UcRhmZExiyrNlj+Oapen5ChI4ezJdFC6q32PT8BpBr7baGmQEUocVW4g3LbMXyNM
	f9aOP0VFSMq9zChmvfb+5R8rTct9af33SH94TMoF3kdDNYMIyr8YafSiAnM=
X-Received: by 2002:a05:690e:bcc:b0:651:c642:92aa with SMTP id
 956f58d0204a3-65c3d96c23cmr13772518d50.4.1777983934692; Tue, 05 May 2026
 05:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 5 May 2026 14:25:23 +0200
X-Gm-Features: AVHnY4LL44QJqBkbe9sCcXJw21A8-75K1LYnugX0XOneV6VVtcfwiV6fhBeQKiE
Message-ID: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
Subject: Regression due to /sys/kernel/dmabuf/buffers removal
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"

In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.

I've been using this interface, specifically the exporter_name file,
to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
exporter_name. I've been doing this for two reasons: 1) to detect that
mmap on such buffers will be fast and 2) to detect that GPU access to
such buffers will be slow.

With the removal of that file, that detection mechanism no longer works.

I'm not particularly fond of that mechanism but it was the only one
providing that functionality that I could find at the time. If there
is another one, ideally an ioctl on the dmabuf, please let me know.

Shipping an entire BPF compiler in my application, which the original
patch suggests as the replacement, is not an option when the removed
alternative was simply reading a file.

Thanks, Julian
