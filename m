Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462404;
	b=K9RQ/r6MSP3gxMGsJ981lrt+wwxs0o/Ks9qGFphmOoqNQ6drlSd0Ros4/ywBfNtgG7ow
	 4obG2kAk42vhi4p2E5JzQBXtWrvjpdmK46NMmLoFAWwAO4u4qG/4jDY6ytTmVk2akkree
	 vosS3FzQwplHq6UPODHZLyOvTcInmW4zKhs8UxJlRbio0Y/EI3V3LOZVu7hv7s8jKzLH/
	 c4BYDccYLgp+M7QCHTwprZuPN4oEHkvON9KY3nc7Jvy8sFSNfe6ximt9UVnh/bJpzXcDt
	 FGHdmWDimp5nchcVgFpJlgHWohOlA4GemBBHHWQDE4UHZdkzZnJz1oJ5v/xxEwIeU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
	b=Cv5n/CBWVlXZ/1eEzU7zu1ZDyX74c55p3jP0DmvQEvMeBT1bt28oiFQCo/+Wx5PC61/8
	 TdCv/blALT9FRMTrB58uRPUuNQ7HzLs8mAtFxmXT7TkeiN1c3pdNSinQb1ceAJNCEhsOZ
	 pAw1zVeMS2h9dMZHofrY+INy+K8njLpqSGMm6lRTZ7Sg+p5k3WIFD63vSNw2zTHczHg6o
	 HifrVeb9csuIkTcssfnV0JsTey96jIbNw0bpoijQGWanE3CQyV3yD/epmUiiehfwned81
	 35U8ySA7mXhExceVcRnWD/rnnfXKODfxNEQ0N6S9Up6iU4fZibuLbp3HJiawRuvFGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ny08dYQg;
	arc=none smtp.remote-ip=74.125.227.200
Received: from mail-pi2-f8.google.com (mail-pi2-f8.google.com [74.125.227.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294E606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7294E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ny08dYQg
Received: by mail-pi2-f8.google.com with SMTP id 41be03b00d2f7-cddb56fa486so82007a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794462404; x=1795067204; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
        b=ny08dYQgHyS1aoL7W3IywVpcNJWKttWcUi4k/lbUwGHcv8kpm1AnQppcEQESH4qsAl
         i0jj0ulIpHhqKoRw4TicGzk/Jarc9xrheuql3p1WoWRjUhIiWMe20FPzqBgFtisU03X7
         Uj1Jxvu7iex+W9YASHDgYL3Nyb6ECgXtvm8Dwu1Q8ddGIPunf3OSOP3xmG4FV7DDL52D
         HWW0O5s9fcmKOvBaK3LXUceW1fEZNMCrTZmqPvtMnw8hm97mLexoNLlfCJKpqfK1JFNF
         hqmS8oDhNzklm6KorH43IT50dxSWy82uii1p2X3DGW5qo5P2o/Y4rxX6zHYSE3+BTx3h
         yQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462404; x=1795067204;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
        b=LrP1FJfDz3GaPZCzbCaFkpuyhgUpiIg0xuzp1dKSE1QlkaJLB4WNQPCO0IsZ32D26s
         Dk36FqRRyc9dN3KhK+9QAXy0YxbhwH1ue8aCHou02q+vOQgj6FnJaK+tuQksfuFt+4Is
         Xjhm63VLirksw+keg2ExuF3LlxFPz2AraUiogyLvsDig1hrkJLA/fLllRZwTeZvH8zur
         oCvrPBgm5k/9IkWTxf9j9y5Wlqyw985fMsGb/U1GIYhY0o1zjKiRyegYm6iuVausP2RG
         P1ldX6Wf9qaIvoWL1cbhrbsEASDr5oXAFzdBOSQiC0XzidVuHyqnomiW0JjAtXDJrUaW
         3oaA==
X-Forwarded-Encrypted: i=1; AL+hErE7GoxJgm0nJ9dJRlYIP3WnfgVZKmEclSdny83OomVwUZ9w3IZGhfoF3eFXvJRSjNQQYzd1ItlPPq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iDkR8LQ14+Sw2XgLh8g9/s31Paqjw6OCqmI+jd0bXR4YkDKnQ
	QRBSXEbUi4LuneiubtyPNd34Q9+4wSMa5mEL9vzc6DRco0m1TGxQyGYZ
X-Gm-Gg: AYBFou27Bw80xLKjvMOUkcrVDiCdjOw88nPy+QNv00h9GZ2F8rZT0CqyIv+24aVcXjD
	+LCLQXtp4MG9Dbw94vVfzPdi1nG+SUAf6qA9AHlPcr/XoM4KIE2kuDV+8iV/EB/l8ROwNVWKy4h
	xS3G2mo24wXXd32n94lyjTY04GTlrdBz/CSWVBbOqxOgb/2hEnu160q4jfCbsG1pLVoUaGV7dbi
	8r0FEe9JHVCB26cq1AmIRlSLBuG1yD11FtErYXPbdyg+8vhQYW+ma30+/Vxq94zXz7CXG2UJven
	OmHR0KvmepTKZk4ZW5xNgWUZCQ9SGuUKjs4iNk4MVkdmjeNBrVRELDcq9tEqd8Ev7ixkQC/GS92
	d68mgHgKGO3hDsrSNRg+KYn3aV6vW8EnPtPAe1vwBu28KN87HgQ1mG3Obsta2AyNs5XwHjlHnWq
	01gG5euScNB0Wzm7yhb3osP3gH4gUCgo9wtHykYhldGri+YevgOo20M827PFav9hd72rqI4Nqr1
	Wnr8+GFCrY429rIoZ6cT8XsC4vkGUJt8xI7S0CVXlIEsbIe34hxS2ow5d3Tx7si79TaqsVjFQGL
	7GSS7/q+hg+KKR4r5o/MU9SlvMGYQzxIcfHNH/1iYUwHN9+NX8I5yBEDozmQVgOXb7YQCEOhWo0
	cHrXBFsizEBi7i3y7hkPZdTF0ag==
X-Received: by 2002:aa7:9a86:0:b0:8a0:4032:af85 with SMTP id d2e1a72fcca58-8bc16651ea2mr4128251b3a.0.1794462403606;
        Wed, 11 Nov 2026 21:46:43 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm2776591b3a.52.2026.11.11.21.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:46:43 -0800 (PST)
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
Subject: Re: [RFC PATCH v0] Docs/mm/damon/design: document data attributes
 report infra design (beyond page table accessed-bit milestone 2)
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 12 Nov 2026 16:45:39 +1100
Message-Id: <179446233975.762943.16115029371266375222.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261111185412.145514-1-sj@kernel.org>
References: <179438255225.3134195.10613668244848761847.b4-reply@b4>
 <20261111185412.145514-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Wed, 11 Nov 2026 10:54:11 -0800 SJ Park wrote:

> In a real implementation that is aligned with the design,
> the probe will hit if a report associated with the sampling byte exists.

Ah, I missed that.  Thanks for clarifying.

Thanks,
Aveline Noir
