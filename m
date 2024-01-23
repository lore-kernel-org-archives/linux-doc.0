Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BDA1848
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705983248; cv=none; b=Gf4Zz11L7/IufN9eyUb1CJHjgp3/7nxEOKo0E0mwUvuxpsyqcBxQmykxwNx+Nwhka71dv6DLiye6IXajE3xPx9HgfqxDhMht0PsyY0HILy3iViP/uX/XK8BS4942qQ7fTS6Pkc3zjMSWo9lLejPIxDxT082cCPCi3UTiC1IkomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705983248; c=relaxed/simple;
	bh=58JM+UR8Aha6HZL221xIWdqpuUieCN8R/qJeUi9pUM4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=s3/BzQy/+CXM6vHY2bqTL/RilXLP8r2veJj4tkJhQ+Z9gsz3CWPwoTCt5rdI3bT7myEGKUzQY01D3M2OWrY6p3RIzhu7QzXSmemM4DRxP9QDLc0rSPDfs40a1jQt03ZqNO1iSJK+sfhE+8780IFzjoAqQS+2BL8QPujVAThE/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw2qdbyT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw2qdbyT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d70b0e521eso28062435ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 20:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705983246; x=1706588046; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ihh37Z1JE+OCfeEhbgad9pTN9F6du7nBAkag4ZYIOc=;
        b=Iw2qdbyTLQHs2Z2CZOhuQYhJsjylNoBqwoG1Mk1hVMdbi44oNm/ArFz+nES1rHa0J5
         A3rpnkPWAC4YrM+9ps16Y8RXY04VtUK8yqsUauRLYO8SIUdo5iPn30RgTfoAR3GjENrK
         XhIpiofk6O/CT92hAMvhcy7sm7RPZE8qwvXx5K6ar49tJDgtOIYHhfSshM2xmkc1qlFH
         vZD/fExKxBfMXg4MQpnabMmpSDQlltf6U0Tmv2kdvUdxpW6z0iSh4pP+szMyIBxGbKNP
         1DFICIpIzNmdXLcnF0Sbu44v+6Mn5FHb1r8bsIC6xit0WHJ37G3+QU1fdrMh9K9+CVTF
         5s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705983246; x=1706588046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ihh37Z1JE+OCfeEhbgad9pTN9F6du7nBAkag4ZYIOc=;
        b=CWlFB3tBBiJThGuU1yFPK1dwRb9ImgNvoluutYLIPq5VgzoDLh06qU39/q3dN9IBOe
         +20Di13hGCGmxWGnG85Frm/FSbO15SpQzU2jwnyLEfNcGNQQ0O9A2N7cwHZSh0N3xySq
         cWyS2edTfPK/uojCbtF53Ta/U+E/XQDzz3W9ZAdDPNBVueLRYl91az2/WiYZu+Ipe8ek
         I6fyqtNchchndSMrDMoO/OBzvDS+OJTUDCvVo/ivZBrvxeJDPgaH7ydvSRSRVyc44GvI
         0QAYeJronEzcJiWEzvoqUDSuggn3G9OYVD8DJmYtq3lQY0cfE6DHhgbDEWqUaZgvUJJg
         MqUA==
X-Gm-Message-State: AOJu0YyBZAgylOyXRhbLs3904oeFunEBU4FaspH9gyJiiZ3h534mW5Mt
	u5TfM6qeAFT2/n6KeLb9P2vt63PFSdpn+uB0q+O3c7ULfU3pbIZf
X-Google-Smtp-Source: AGHT+IFvFA2Mw8/I3ZedxvTx+FnlXw4LnU7XUY57ITorLjxqYDMWrU/DxEl9CcFjtk/hYxVccRs0nw==
X-Received: by 2002:a17:902:b718:b0:1d7:3f26:5368 with SMTP id d24-20020a170902b71800b001d73f265368mr3735456pls.96.1705983246517;
        Mon, 22 Jan 2024 20:14:06 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902860500b001d7623fc8a5sm1221529plo.143.2024.01.22.20.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 20:14:06 -0800 (PST)
Message-ID: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
Date: Tue, 23 Jan 2024 13:14:02 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: docs: requirements.txt has stopped working again
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Annoyingly, installing Sphinx 2.4.4 using requirements.txt of v6.8-rc1
ends up in a run-time error which looks similar to the one Vegard
reported in commit f4cac0f74658 ("Documentation: constrain alabaster
package to older versions").

The new error is from sphinxcontrib.applehelp which reads:

    Sphinx version error:
    The sphinxcontrib.applehelp extension used by this project needs
    at least Sphinx v5.0; it therefore cannot be built with this version.

Do we want to continue whack-a-mole update for Sphinx 2.4.4?

        Thanks, Akira
