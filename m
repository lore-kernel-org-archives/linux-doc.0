Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739891;
	b=SXPZuJxuttiPWiONUiKQIZV8NtFsakciXffGrj76O321sCbDebiQzGLlBJa6GYrd7p7f
	 +qnNnHTNly057tBHSQ1ZudTiZ7unoUPvpn5OKcRxu4K6wnmjWs1uM3vfw/yOukpH2zQE8
	 6INBCZwqTJu6ziAjaQSaV02QIVFSPFNp+Bzr4HnLEMbvUTt/spmv4NF9bNBTw3RuLe4wS
	 v5SSYyuQqEN0NzyusC5rqhDbqGDYaOtrmx4h48APoyakIYvPAVrqA9qgHA6BRw7D9mchf
	 h30K7bNP+8/Te5WcJG2Dvy+e7gyMBUibE4JTcxAN4ILbCwyiJMk/Vz8OgAdk2sqHgTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LWsu4t1Z6rR8vk07XEWna5nqyMHBxZlP0kNSwzNj69I=;
	b=sT+PXWZ4Le+Tbp3sxo1YPMF/Dh9QZE5jE76YmXYkfdoerVEHGSFc/s9B9ZCRsgzRhHYU
	 zCE7FesVQt3tGRZ2McjfIIsoWh8A6rJ/B8KRoBzEH4L/lN0Q3jtFE2TjsBtDD4/LQLJNS
	 v8aQyP3NjOhQ/SjbA/yaHyu1LhgdKO+c690yKuYJ2+jREfEDNs0l99YbbsKRf4w0sIuZ2
	 +RN2lm2LcSmDzDOuPj6G6WMmed6nKCsL3QRK/8yl8998Xo6T55h8P3p0mUIUfiRscoviY
	 VhcvGrZQ7fLGkQI4VlCUXRURX1RHStSDvr+8U4F34I0jt3PfZymZyhBxw+7WINmUo4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwbah4Pt;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB159606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 00:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB159606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwbah4Pt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4367914f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 16:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739889; x=1796344689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWsu4t1Z6rR8vk07XEWna5nqyMHBxZlP0kNSwzNj69I=;
        b=Mwbah4PtjxNzhzQX2pknAeb6/sYufyfivt8FmkDEKSNWgmbyqCT13qjDQFmkKmvHpS
         dC3Po63UytlhTSO8jXvAJkeSO5JOKOzYCKDyhlRMaX9uMMW1F/IV7+0BYhdxFv5BF2Rs
         a1jEepSKSPBaWRaS89vmLNwdNTaZIEdsb635SgfnI4O+qTYkMfFmbDDuWz2cJmFAXZXS
         nBLZhQbZ59Ck6Ts4MJfi/Hk6Xudyngx3Bn3lNmJq5mPg0Ip345X7gFz0izZZ1am2WKfn
         a1FDWS4M7KALxfKxTHaWKqZXI9vpf98oB7IiNwnN6wDe+mGhvr3Z1Go3y4ZnnwE05d3E
         Wz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739889; x=1796344689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWsu4t1Z6rR8vk07XEWna5nqyMHBxZlP0kNSwzNj69I=;
        b=za7vDjPqatOz/11bvfg6Xf4Rx5uKazL/dBy+2iGPPphGoOasRR+e5yvCmIsb54jF5u
         DVXGQRN9edKHdYtf7iYHf7FnTIVcxsC3HATGT9vAgfqPs0xh8ZUqS5AfBI5+dTxBqiFu
         MVWliuDJKbB4o8RsVvVKKrBDrq5Tu9DqViUMbdiYrfajls7HoBF8x/oz68v4smq7iCd/
         yXi87+ItT3zedVfe8A9aiKS/GE7/HAx8Kqn38NuEoFwInkAde8AUfhpsUljo2cuGWUD5
         9gqhN54kuPRiao1GBVXqnNQyA143ka12jVk75yXCCG4HZdxCJqumN2OGOHqzE67spn+a
         5F6w==
X-Forwarded-Encrypted: i=1; AL+hErHCLZGVYzoZgdgPv1+vpq2it2dO+JcRX5x2lAlH/ajKe29sf6cO4+3AcyLfDFSZeta2Cv/syU4HPBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g3e3Em0JA+W0sP1uZFnPIqjFVe0kPfmZGIO5Oxk3ommFG6yBD
	bV1N//3OVdGOrPiDok4ffkWlIO7jWXDBdqXPUhvVeCoNXk1Rx+6DxV5X
X-Gm-Gg: AZFdTZcfv2YV0ADcLLInp7cDbtWV7/MPxfPRP8+6vJyNovDC2Pnk7rVPyqcoEXgQBwg
	7hTTS3aAgga9H5koZc6NWq5CBY2pLj/5eDC5LgTcvUEIf21tgnHfChz+1Cy3AM06TX92MoMtU7g
	m+k6KexmFip0BjX44AFyQTM5mrV1UNvGlxl+fktWkb3NImOMu5rhXy42a4CmXsKKHQvu/6au8fv
	JCB6UhzgeA+94kRtu2ZcMEaZmjy3Fm0IbUHkx+YgNY9bsN4Ezc+o86yP6+juwH+v0fFCPdFxGfV
	11Jad4BpZjT8i/mKi8qqA1/PKdDchaMkqtw/SpnrWXFOeWL1bqV7kzDjHLEvxDVu19Tz/Lhbw7k
	drucTctUPXUk9816CR8xE4LcaK3HmAfpZfcu5i6MAUtpaIHEDJIzHdFvfKD9K48L/4fIrrsD7C3
	4hWw+r1HwQiXNv4v7n5Y5ONbnLDcilHmrTsfItlNgrR5n0OqNPqWnYNTf8OgtkUyyK0yA8dh0/3
	lSomggkp+j8v4MJndy7AhSbscvoDalICQho2pNiZPX+dnwfZqlFaLNy7YjkPY3OACFYu/Gi3I84
	EAzzmQKXvEf557apWpYjjZiS8/wIVV6i4F8ssL92cL/5G62KMxSDOGSB/Ycip9I7Uw2Mt9IBQll
	LyBOCS3B9tg==
X-Received: by 2002:a05:6000:2503:b0:4b7:8178:f7ea with SMTP id ffacd0b85a97d-4b78178f825mr20085072f8f.51.1795739889037;
        Thu, 26 Nov 2026 16:38:09 -0800 (PST)
Received: from mohamedali-HP-EliteBook-840-G8-Notebook-PC.. ([197.21.14.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm44693592f8f.2.2026.11.26.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:38:08 -0800 (PST)
From: mohamedalibouhaouala@gmail.com
To: willy@infradead.org,
	jack@suse.cz,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>
Subject: [PATCH v3 0/1] docs: filesystems: update filesystem type, superblock and inode documentation
Date: Fri, 27 Nov 2026 01:32:35 +0100
Message-ID: <20261127003236.20196-1-mohamedalibouhaouala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-234265@kernel.org>
References: <sashiko-outbox-234265@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>

Address review feedback and correct the initialization
description for ``file_system_type.list``.

Changes in v3:
- Document ``file_system_type.list`` as an unhashed hlist node.
  A zero-initialized node is unhashed; explicit initialization
  can use ``INIT_HLIST_NODE()``.


For context, ``list`` is an embedded ``struct hlist_node``:

```c
struct hlist_node {
    struct hlist_node *next;
    struct hlist_node **pprev;
};
```

The initialization helper is:

```c
static inline void INIT_HLIST_NODE(struct hlist_node *h)
{
    h->next = NULL;
    h->pprev = NULL;
}
```

Mohamed Ali Bouhaouala (1):
  docs: filesystems: update filesystem type, superblock and inode
    documentation

 Documentation/filesystems/vfs.rst | 181 +++++++++++++++++++++---------
 1 file changed, 130 insertions(+), 51 deletions(-)

-- 
2.43.0

