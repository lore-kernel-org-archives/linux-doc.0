Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9135AC03
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136176; cv=none; b=kVVzDolAnFGV710KlPUQXHpP63VJMjXszo64EVQDIkEFTLqlYjQJRyraV7NXSuMfLhaYnV18hrX500nCXEJ+UkDpZFoBgjLwRPXNKhqXQk88lZCj9I8IUdBqtcNTxmjeUe/3Tdp7MUkXLbvf/Fs9XtwPmOTW6Liw9cJheL1DW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136176; c=relaxed/simple;
	bh=k0PwZWtgvJw2zRg67NUlQSeJ5rFLowk5RShX6+SR1JQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=am8i36nnAS98QLK8hifMfzteKkyB4eEFU5msE4Cz96gb9dKErVWYydqOAYwfQ9+4nJyd45H+kg2DO+raEXsc07EWBBjgELmI/AlqCTle/ZCGbo9wGfRX6E0uWVSoixrNBIRM7PZY1KEor8wo1AeSZSuUveW2zow8M2EIkT03ubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4ie2926; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4ie2926"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so3303142f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786136173; x=1786740973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+97syVWqVx1hhBOA8cAB/VJ6eKbIprJ1K75ZSk567U=;
        b=C4ie2926aILvdPChabf4s++MIPTnM2pW2/rHngO7KcEEjJgUM+HeLM7U3RBEGgF+nD
         xQfFSoHa8Y7DO5wQXgLQcyiSDNllIwBB9KXOig+DwMPQzynxDJGzIok5Ak7/kyT68Z0K
         QWp8tFMQy4uxfn/pRJQrUjpzCPqj5Thi8EDQK3/DvJXLpt3v499NV7UO2jIrFmVqxMK7
         BVeS1bpLWksvtOi6zWwKLEpknm0gfjNtP2rvLTztpXVGjx1t92P3Ol2CUDiNcJGHs4NP
         PYD5QvHWw8Xl1GopTSpRpcT8tPHN/Tlq745UVLQMXWqEIBx1L01txooPg2wath+JmhX5
         GmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136173; x=1786740973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+97syVWqVx1hhBOA8cAB/VJ6eKbIprJ1K75ZSk567U=;
        b=eJPTscD/HiVW3kh4b33q5mTiERzy2sqRPVeRUzk4mdlwicGIV3uvYvdPbQFCwv/7CB
         ziTL++tklpVwlerIpgGnBJLbZeoI1c6pineYt2jSDtJBA8H2P0vSbZrTDSayGgfFq1B7
         SvbAb4MWo3rZ1Rt/e8jGsnF8gxEbzrOLNmQXojFXW3WfjL7H5GEohTEgM9rdpaqFp1QL
         J5OKZWKPxlH9mM2W4FIWvZ2BNyLj96uGqoR8l4vc42jyll3jRJ7vGYLFktpd+kV4sRF3
         I0hcUK5uSRGkxqqiwsOextoS9kLp4uhzojJ74wMR4J5Utwtl8+Adh6MY6LJFOc9RSnaN
         nQCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGVaQ6rtYTiYOT5afKXIE460tKIf+otTQbaF97aZq6AAkeWE8+oC8V1UQXthmwUnhXiFcOq7VVD/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxctQlDGTdTGPR+h/AzNwMHaqz2OhdDz9/MY7Kk1L+yHAGeFLV0
	UpjPuf0/stHtyY52XXek2KsluKcoa/X6RFzcJbLf3hrA11o5qA4CUxwe
X-Gm-Gg: AR+sD12yE9ljZ4BH4Biub4UB027eS32Mv3zYbWHDcRall3ZkG/w4kR/PsRxggIlaK6W
	UrfSzzZaS21aQ8IsiBCehtdK+6EvbbX4hV3/u/Q/pzb/tIoiiFx8D51EGRMLJrW9biGzQUwG3pF
	rq+RaFvBXhCw/LLYZ2X5dSwmy/lT2p+cXAHifI68JuL/aJi73eCWQBSlHQkRG8zO9GNWuG4QeM7
	LajxbfEww2A8jxy6/efcPozkv4xGYld/ULzl54Io6+yiQqPZVn4SgrFBJ9YZAFKUkaOxq4eKGc0
	smjkNwld7qFpaJzMrryPrrulpPVHbRfyQYnz2AMJht2gikTpgEnrxOhZMrgSaCbpWnCF9rdoKTm
	4HGLU5Fjbxjibp8f5Ie4aFSRW5DlbUAwN0UEwTaEKwn9CxgKaaZwYQX/xJVnan6whTr5fR9k5o5
	vOWDnTF+m/SUYwC+quH4aosoi95qdmGJgBXTW1tomTKUie7FchmFu56QNavlPYz8t6Th3Z6a5OG
	LE2DnfAYw==
X-Received: by 2002:a05:6000:29cc:b0:47f:9266:9bde with SMTP id ffacd0b85a97d-47ffd203edcmr15201425f8f.4.1786136173273;
        Fri, 07 Aug 2026 13:56:13 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:848a:c270:b637:504d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021501bcsm8897658f8f.9.2026.08.07.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:56:12 -0700 (PDT)
From: =?UTF-8?q?Christian=20Melendez=20Nu=C3=B1ez?= <chrismelnu@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] PCI: vgaarb: Remove stale "not implemented" notes from docs
Date: Fri,  7 Aug 2026 22:56:00 +0200
Message-Id: <20260807205600.198878-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807200639.172487-1-chrismelnu@gmail.com>
References: <20260807200639.172487-1-chrismelnu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> Is the "unlock all" command fully implemented and working as expected?
>
> If the user holds only one type of lock, wouldn't this fail with -EINVAL
> instead of unlocking the resources? Should the TODO disclaimer remain
> until this logic is fixed?

This is correct.  "unlock all" sets both VGA_RSRC_LEGACY_IO and
VGA_RSRC_LEGACY_MEM unconditionally:

    if (strncmp(curr_pos, "all", 3) == 0)
        io_state = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;

but "lock" allows acquiring them independently via vga_str_to_iostate(),
so a caller holding only one of them hits

    if (io_state & VGA_RSRC_LEGACY_MEM && uc->mem_cnt == 0) {
        ret_val = -EINVAL;
        goto done;
    }

and returns -EINVAL without releasing the lock it does hold. So "release
all locks on target held by this user" is not accurate unless both are
held, and the caveat should stay.

I'll wait for further review before sending a v2.

Thanks,
Christian
