Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830185;
	b=Gx/dNqMT5jrwCVuaDBRCOyWTQAi/YC6JmDl47Gw+FGJghpKMr79et+MFPfgSHy29yvbX
	 UW4A2E7H2eYtgBWoHPcVZ5xt2EJAwoBCn7pEJB6/NZHboLFfQvzseZBtFyxiVPz02JF8m
	 /6pIMMazSzCHK6XN7m7z6zUXHq1emZneH3bRqYP63zedFfvEnJ74b9SMe73CwJge9VDzh
	 X4nCmE5hLEwz/ZW5bX/Xe/EELzwQiG9frqWs87WWEXbV2pSV5sgsvArE4fIiuRqYMtYG1
	 MZBDvhwfFmJUDV1vOLE0Wt47UR5LDReG0SGLySngzSVStEZuqUD8aOsi6CXdXOB4IIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pU85+W9fvAkmx1bc9xwBw4azRA6Y40m6TI3qqA8pbpc=;
	b=1lQGZ5IqoNduGPAiVcxAj2HQoOUDy5/pj82qmtdp6bg2ePpTiNCE4JLYcSMamsTO6TKF
	 zeLHiSXlRuenaDFtzHp1eTyKfjn4fscVLPdbahSqix+TTIHpwir2rgdsAdkd9nb459lS7
	 oMBEnOIlSYJA/fS2gNFHOlNCUGqji0J+WabEeW/A6KgLJFioCpLCGB2Fh0vAPpEohmLsS
	 eyidV/M79inUJ7P6rV5ExhC+N+L30tAwYabkoAUAWf/134/y0K8izi1ejgGtA3bMqkEhD
	 LVKNfJV0ooSlSDSuE0je4e09bqFrrEh51y2AhaHFoy8X8FUqKPMzzeQ1r9famXIDx5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTyUMGc6;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603D606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7603D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTyUMGc6
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b335eeb340so24011137b3.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830184; x=1795434984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU85+W9fvAkmx1bc9xwBw4azRA6Y40m6TI3qqA8pbpc=;
        b=OTyUMGc6hgxS/p7EJw5LJo5QxmQLhK6BSrUM7FtKJib4Z6bB13YhQ6nKlUF5chBbOG
         zkwOsJarfAneDAo/ukeCfNOCQ4j/Y1NIHJjviwEOqvoVLzAqY9A1Td0TQl9ElYKSI99n
         nCchhCkBMuWW7G/S6eNDiNJx18wFiXeiq3iTqz3LxQ9OBpneguPHgH56oPpPT39Kp6qA
         6EIhDUakBecGH0OhdQYenCcP1sQ5JU6REwKEst+J5iDDYEq4xTXfYYXm2qixXDUdfURl
         0ZD2cjNyHLn67T0E7PlP1DaB8+2D1efSCKcFaEKMTb4T/3KfNhM4/Wzf2NbXVZ5Xg9KY
         oqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830184; x=1795434984;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU85+W9fvAkmx1bc9xwBw4azRA6Y40m6TI3qqA8pbpc=;
        b=eUCxAG6ejyPRqXZdAZd5H+h+c+8hm44wuKEGkX+RC9YtBmi0Re7g7CnCUZcQCIAAGQ
         vyKNL+7qK4G6WAQG3NImeVMxWrLMkdJnw3iNryxrJrtE4I0xgHv2d/Espp+ujuJrUsYp
         39uwEOIkWHGaGRStXL8rzyD2nTshmks+4N9SHW1qhJnHQO2N7JAfTStH+pvsCtmEG9VE
         NN6anxjCVosdqHTw5fmbYB02y2dvbsQF1QHkbv4xJgI7rv0urD9MBKwJ/p0UGS3DaCmv
         5j9yIxQCTcxqBIw1EKIKGWd3cM9UB+ovn0zEkBECVpDKQLK/P/88JaZ/xLZFMtZhASFn
         Grow==
X-Gm-Message-State: APuU4Z9CAaZ2bYqKekBT8D/P7SvkN2PCriYcDmfSkfL22SW413k+JCh1
	ESVfIAb0FxSOV40OlYUPPCXDkXLbzlWlNkq2ZqmkUjkX8SaiYM7ooN656HzO+xFmjHLC6w==
X-Gm-Gg: AZFdTZdrzKcZWV3s3kcnMQtb566BFQo7GL2vy4roJYVmyDmphKXvoROFV5wN7tKQ7ri
	eK8aWY4rO+g+LW9/8q5gt3VjKcHYnnh2Omn5012BYxSSXWvX3t2wvo/WUq7eMJd9HZskYqelIAO
	cxhPdNzQOSYeOBCPpzQoBJ9ETqZf8vo+xX1fJUXmhocFs/vuT7YN4zVmSO8/inK0SIWP7PIsfyn
	NbTuDcUqZO9IUxd5jsI79WOonDihI5TZ9MtxfyO9vnuqfMldRF6W6PRc+gKfZ9U11xRSkQ3kWMk
	beNFEzR+resFn2WnAjnQl/se4MaYk+DoPIf+vf0k51V9UY1QlIVGopOU/t/nNaYOn53zM2lCOYM
	G+KLH55/4BBys5+BHThBTHQUE1I+OVGLrjnn6UhaAFUybPTZlZfKoBuWDUBJSTb3dMvYN4gwVD2
	yM35T0hdVZNe4v7ItwW2MpgjbLwr7ibjP2PBTWiCwQHnixXWiyzncnvqMxK9vNL9lSegwvuDgnA
	pZnZvAOW0MzORrGIYB42IsBipjjYGt9DZnaZbA4s/4JTnwTYp1xZ8rfMgdeQAw92QwI7i7lTYJq
	v8n5/myW2mLvqLDq1ahzyIlr111QM6+oX0DfY46mZLjQvdusOO0sq4jUmZIgvm7ceRbQZ11MgCB
	ZfHidcwBnMjCvwTgnK+n1eFehE6KOpYT43/nqqn7q26zrvm7VPJh2qlp27pq8NpK0UhjLtwRiC/
	lNmS12ygkle7o=
X-Received: by 2002:a05:690c:399:b0:8b1:3707:86a7 with SMTP id 00721157ae682-8b4aa2dd736mr56628427b3.83.1794830184318;
        Mon, 16 Nov 2026 03:56:24 -0800 (PST)
Received: from Daniel ([187.45.177.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm84198817b3.36.2026.11.16.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:24 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v1 0/3] docs: translations: pt_BR: wording fixes and plain process index
Date: Mon, 16 Nov 2026 08:56:02 -0300
Message-ID: <20261116115605.174735-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jon,

Small cleanups to the pt_BR translation: wording fixes, plain filenames
in the process index, and "branch" instead of "ramo". Based on docs-next.

Thanks,
Daniel

Daniel Pereira (3):
  docs: translations: pt_BR: fix wording in index, disclaimer and howto
  docs: translations: pt_BR: use plain filenames in process index
  docs: translations: pt_BR: use "branch" instead of "ramo"

 .../translations/pt_BR/disclaimer-pt_BR.rst   |  2 +-
 Documentation/translations/pt_BR/index.rst    |  8 +-
 .../translations/pt_BR/process/cve.rst        |  2 +-
 .../process/embargoed-hardware-issues.rst     |  4 +-
 .../translations/pt_BR/process/howto.rst      | 14 ++--
 .../translations/pt_BR/process/index.rst      | 74 +++++++++----------
 6 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.56.0

