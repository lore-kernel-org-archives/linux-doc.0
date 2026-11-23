Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455389;
	b=qr00bNEMf/XMdx1gO69vPI2SmwbJMpxOnbPlOeBTgWOPfjgV0zmFLWQ9xrqPmm5kkOpO
	 QBiutwpZXOi3ITX/PfnBTVve0jdk0lTXXDZ6Z0ChJkzV4A+mEMaa1qiaqKdcK7aL1hH0d
	 ctSlQ7Gu+HgBkFYcKQErwYfIzppZl1SvO0E01gRz58r9HU4DCHc8aCcg4N8cPoCt31zX6
	 bhGto8jb98MQbSTbUeTENuMtKF6Ky9jcZrkmBauZXvMkuV9klIHPUz4dC8XpvyQq54o6g
	 cRMTeicZBcImAHZhgOa5uE6yFXNKEEERAgwjlcwrSZHIkoAlEACTuzvMr9hjYKd12eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=G/aUT5PBmLZcyNJkQoSxFcXbcPE5jdOsaYBnBQfYlQU=;
	b=T743YUwhaIyPJy9TdHD97HemGIqwyrEldVe4G8R0jb8uTcPjYFbsbPmGonldZoYfweru
	 PbZ9d8ps4DFgLZtJm+4mWykGkDM2ocTUX1dex1EmAUmBvFakvSULAuj6DLOPQIueUj1nI
	 RoKBislD2onBklf+fr8vd/vL+Zb8sLCkMkTvOZhooJtCgevX0FQno7W67gdZ3KvNLkkgo
	 cy3Ed5O5ijAYwXZ0P3/+MJV3ZLgLg+wSUim3CfmFi/UikXvXRxY5AeiJqEExlwl0ZBRbe
	 U6W5aHnmE04Y7oTQQFcIvhNx23I+y6u0aawQYdHKHMVTbro9hyNkEFAAiT4xVzd5g/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPOSV2pE;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE0606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPOSV2pE
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3869c1f4d19so839527eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455389; x=1796060189; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G/aUT5PBmLZcyNJkQoSxFcXbcPE5jdOsaYBnBQfYlQU=;
        b=wPOSV2pEa7iq3+bSbgaG/46dl7S0B4pjcglc/YlHH4anQQ9Mr+qQM8+ICeTh3sPP4f
         ILQcv8VmAGjcxhUQAntEDfRXJifEJ/1VQ5bmyrXCHSR7ndMV9wGwkNXJ0iABXkiSlDaK
         XyvtObvvVOjYWHU1uwWpV+oxpsA1LuxtQ+LsiIceC5RLpmPg3dDN2/VBpftGJe6YBwvM
         Lf+5RpHU9tmM02Gkf00WCJLNFa58Qp4ZhzG5071m3Nd1N8NNCDVzHDIVHKJpprq98FK/
         6o6eTwutRVkPvPUI7Byk7Eln7E6xmVNNhaZl67dAyBJUz8c7/nfOTR0Nk7+F3GztJGFk
         ulkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455389; x=1796060189;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/aUT5PBmLZcyNJkQoSxFcXbcPE5jdOsaYBnBQfYlQU=;
        b=erT6hDboxzrw9s1lJlWC2USR6BITVLXfVk7tFtXa9Ryz+D7awAHLz7u1Ab4wBUuWP3
         re9ikt2KyKHpAWQFfrTLMWjWsgUbHCvbDJaGRXPMCtycjjRX47ToOlEtZMft6LjHBKO6
         vxFrsH3sr3pOMIOEO1r+Bu6H2fwZ5IB8xTOsHBMEgZZK/nnA8jUrRz1kh3QEHdNPlBDS
         APcbdrZPcENuXp1tN7JeBFfZwHLbImO2+zsofPL5/cr7FReHa6Sl9s3DTY7mtEi/ikUJ
         +GqBjsY/+evfDNQLH1NyhGYlJpDrfhkOxbdEhvH3gc3ngz+zC+j/xGDuOIu/jVnkYNg1
         1Uxg==
X-Forwarded-Encrypted: i=1; AL+hErGG8T/4n4gs6hvXu5ZjUOAczRFi/S2xM7ehfksSQOOZRa94WMy4cEUuQWYh56xG/0ptm58VCYmh8+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aimlywX65JZKazdYwAAqPYqUwF7rAJOyh9d7PlOcBY0UJbXQ4
	rID0TFQNl4OYDuBTx+0ETaNbw2kPC3X7Fm8jv53vb9dRML9PRU6Sqz5d
X-Gm-Gg: AZFdTZcKWtZZew4n/Zxl5xxLeLa1m1dc6wpVd4NQp63cXdPjjLhznIu2I56BeE5Uavr
	EH/OQxPREMbqqJAsGo014XyCSOFZiUDfqovnJj0MzrN7NjRvmI8p9gp/XoodRMgq/vx8q3i05Km
	PWlrzIXQViT7jWeXKDsJk6vY+es3XvDlxrcSZG9H29qOdYNweLs92nKr4jLhJI/n0egqn/cumYw
	CNoPC9gEacWvzE/VIYtWaJffGRHMDASriAyPd+2v/AtqkpAxFrh5/9j9L5gCXRHPHL8fMkvXWyE
	ubI1ido8rQ4L/uxacBNftBdKkb4pLiZ9nQHKMGb2dlNtRGmtg0HJpaMW2D95HfKw1exYNuDczmp
	oqA77iaFqQx0t3Vr7GmBDaFIK+YULJq6kNV33vRMFT0FNjtZ5KbjBklfmnSogdIF78S0gTbleKa
	9xlQ+BZ2fHUV77PDr/WxK/Gzm6AdCzqJv57eV6ZGg23gtTYb1teBivxmNonOQwMu113awH5vUI2
	B4cF+01wDpUDV/UaUTOv4/51h8fMDBDsVHEG9wQeUjNUf2Tj2hfm0pnJOhUlFbTyWUV3FicC9XC
	a/6bTin7LyitAqrCIuqzrNRSVk+00+r4m64QaTyXXdTi/naKDv2ZezmbrcUIk5QKQX2mnYAe/PB
	VHJW23Be0NR1f/NzksuAJV2LSw7REc+f8HftEQhsNMjOeAt70gXbWQj+zKtyP1g==
X-Received: by 2002:a05:693c:835b:b0:386:b5ad:b719 with SMTP id 5a478bee46e88-386b5adc3cdmr2651925eec.33.1795455388511;
        Mon, 23 Nov 2026 09:36:28 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:36:28 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/27] Docs/mm/damon/design: update for report system
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:25 +1100
Message-Id: <179545256500.4.7925013692568446528.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Lian Wang <lianux.mm@gmail.com>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-10-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-10-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 12:59:53 -0800 SJ Park wrote:

> Update DAMON design for the data attribute report system.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
