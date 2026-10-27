Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111696;
	b=c/eqdtm8teymaF0GZ1HcBE6kR9ZrMT0vPob3pVQSyG5xUKftpOEIbYqCOQQqzuSgOr2B
	 0FfwgZL3WJbWQPhJ8mhumnkw3mzS06VceL+7BKV9Mr/WBNAXKPKCQ4F7HLkgDQ78hBYOx
	 oIuzwOM9hZjaqR344z8BYusau7IRVNBW0tcrltJA4S9Ng3YAJhrobl0ZZJkhY8Yx2pA7H
	 qDD8ro9I/GyYcgQXcw9gVXt0S96fZrMlBkf/3zhsZKGp4ZkpI8gmOP4cwxzAuX3GkTmY5
	 USIwuBSjetJjmwLjv/wkXObbX1INjA53f5Vt46ZVmyCjiJmQRLQVTUmYTWYgdBp/krQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
	b=QAV/4o95JShxU5IkOcRSngNnMskK8lWFcaBHOYUxqaE0GiH3BOCYgRoJf3Tls39LoHbI
	 W3+YjA3etSbGR9+JtSDkxpIWGCd0RYfzQbn+4EaVoDyydbW3Gvrx6W4DGgVJDRnHqHmwa
	 avYGl9Pm4Any8UCHgDrBi9kDrAimX4miZ3w0Wg/+uL/UwG8X7ys9JeegtWSrFp5hK0fzP
	 PO5+9HtPTsCN950CWnJovgSWX7pmSy2RkFulkKQ5zoqHHDRidObh5Lj4/yDQd47YbsMX0
	 Hf7xOQp0KtYGzeuhTV6anLe/Usu1ZECxPzdSF7lmgJfSvaiYTssB4zsis9ipPuBt79A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNL1x+Xv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E9606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 14:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNL1x+Xv
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53669f7b518so44261141cf.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111695; cv=none;
        d=google.com; s=arc-20260327;
        b=H6zAUBL8OGahZ3qnK3yMjsmzBwCIkHvhMBXavAru7e643aW0FrKyasiAd6zZRDlkEV
         Lb9CKtX36/hb/ivKWoc0J3Uw1m9qq8tEFKwiIb7rSymbTeZpdKgyYWpe/XVeKElLETSw
         EA5wWjuMoLHjE7DhQKkGEJMUcDI6TPrD1y9BWTVLreDgxbEFZfUD2n+1dgkx6iJYODhZ
         +U+77oVvbxQlBAWynBqwv2hqxwUqHowQHwx3S2iqxIgVN0t7ivKvUUDz4XhltwTkCUza
         vHOGCxl9/FxjMh6TGK6/YT9OvYYdmES36uHXEb83A4oPd9FuS6+X2lAFk8Jbvmla1RkA
         Zlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        fh=oeWNojjJiYUU2PD1SgWT29Egy9OgLMCZIE1T2cTtEUY=;
        b=S4Sxy0kc4LO/V+jDEhZoUfNCL4TumeQ0oJXoHrIT+JaAPRUaYHhg8O/rmx1MLY0GG0
         lCMAv75YscGEdhbsJg8pl5F7Qm4YpcssaggVX4JxAUquI2wS4nOrO3/IlYpGrSjGFJFH
         M4SN0q+ieaHPPBxCdCKZM2c7Egpex/5hxSOZexrnX1xJNMQWpmDEqrfTcVphAEPGL8NC
         RjWGTrK8zpoVV6VJ7VJCZ9vjTZmmKz9FVnrdSa7fvw+cK/1tvKdECt+vNgQtR7qYFw2U
         tSyzyLfL6yYxSO8iXl+/03uzWzgi/BUwyscwEiM6ToXmhB4/0CtMfpmkHWzD1vwsyx2X
         0WIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111695; x=1793716495; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        b=gNL1x+Xv1DnXFPpzgePiAQuuZuxGQYp4vZ1KZEbsXr6VBegt4pJtXNzLeNxrCpoSCI
         vyOi7v6/0+IApmMQXYD6AGe5EUrYKJPHhrDm8nm3kiAEl/doeYsPq0sQTlTGWyGIHSax
         8uUnTg6CWkRGKsQ5Qzhc3YiWHw/HIdwgW7WIjIl/n587BwpsChYbbMrR1t33toZDX5pu
         cO31gnJ7HsIsGJijHvaWYd7DrEnivbFfmTpnn+VmfvsLebMcgPHXqdxCtjs4hOFv+opL
         /7mt9QweVw3fEG1JnW37At3rsmCLkOf1b6RdlUc9/i//g2ff+EPN3LK9o7hPShF19pzU
         QRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111695; x=1793716495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        b=fqfSkunfltkICQPNbKXfFJiuSnePTOgvVHDL7t7SKxT3r8Tol2GwIsRTNpLWCKMkv8
         wXfUyZqZpw0ei7rLp3PlgqdCnbWdh/ZWyyRundKcYeixn7kFDeQ21R3AuyAyYZQuCMXc
         8TIvzZJ3rf/5ickAGtqmdLf5nxu2N5v0slhiAL1Km6/zEFevVUF6sR5obPr0bwpFDg4r
         tHsi5MugqGAlgqjyQlE9ZcRjxhA87sFgPko1nUIxxRgUFFu6vhAuerO/IyidakA6jqtT
         mNdi/Y2RbiPkSaxgFJncPfa78N5TOA2J/jYCMyaJunonO1WPoDN8Ag8lgEo7bwRg3e66
         U0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGnS4V+o2J+QCACfWQ4s1aTlyZmLA4aE5YN8C2brsmu0aEeXpMnSQa6yUxxqbotfLX8GlQHMO6r2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqBzFKQ2/7oOuMM2h+CW7LKjd0uTXCVJdobhWDN6sNqapxm6hk
	5mRDAeOa+BLUkpNg7lz6MiDm6oeItcmQU2DX2K1dDnV80sTTILnxZu0NOjUWZ/8ZjQx5AGQGcAv
	JQ+vVImC3yGmjW2tLOgnZmaIS0C83Ufs=
X-Gm-Gg: AYBFou1/VqKqlEN9XSrjYT7LnkZqnwArYUZL8uXJ79KVGrKr3shQhepdkhvMVdjQ1Kc
	INkJw7uru38Of9CzPpQhEBceVQZQ2BEjfDVfCBjSNSYQfSaxzyavFpZnGXKwqOoEhcjeVCZu/1b
	oRErDV9CBgVP3gXFj1KlQ90pD7sy2qRfncjuya2ER32T53pWCEH6nQCZ0RoP/y5T5DQqvXXSryY
	016CzWc4OE0k41FWdm8+vfyXQRjBcIJjfeTZrgybPJ+KH+ZstJ4mIkckiKdxuATXbHviTdFprxy
	79ueU+rcldnKFVvPy8zwhUCoHS5l5kh7r75XPVdmdvEcLXdYSNDXgU4m8SdDsID/2Uq52Yh27up
	eLiEiXH46cbE1mG1nJ0GkyM+BdM3mIi99x67SXUn3AZgmUQOv7Hi3VlaF+JyV32iU3cuSs7cWZo
	P21e6hVQGBmOQyyyL9qsiJaKx5aGM3cL6vs+IKt3H99DjNaCQh
X-Received: by 2002:a05:622a:90b:b0:536:6bc5:2fb9 with SMTP id
 d75a77b69052e-5383b4a928amr176076021cf.14.1793111694872; Tue, 27 Oct 2026
 07:34:54 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
 <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com> <20261026175724.1482083-1-rathodpriyank@google.com>
In-Reply-To: <20261026175724.1482083-1-rathodpriyank@google.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 27 Oct 2026 11:34:43 -0300
X-Gm-Features: AclHuK_njZlT_A6caNrXNbbG7gBGxHmrzYc6IWZzccr4qUxgXvxpemc8dDRNGgY
Message-ID: <CAMAsx6fdOmV4DH4WCi6u_EadZxdEg10FFnAKSe=g7duTW+eDdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: PCI: Document aer_inject's
 aer_mask_override parameter
To: rathodpriyank@google.com
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026, Priyank Rathod wrote:
> The reason bit 26 reads 0b on the e1000e Endpoint in the cover letter
> is Note 3 of Table 7-149: a non-VF Function only implements bit 26 when
> Poisoned TLP Egress Blocking Supported is Set in the DPC Capability
> Register (Offset 04h, bit 6; PCIe r7.0, sec 7.9.14.2, Table 7-280).
> Per PCIe r7.0, sec 7.9.14, the DPC Extended Capability (001Dh) is only
> applicable to Root Ports and Switch Downstream Ports, not to Endpoints
> like e1000e (and in QEMU, pcie_aer_init() initializes PCI_ERR_UNCOR_MASK
> to PCI_ERR_UNC_INTN | PCI_ERR_UNC_TLPPRE = 0x02400000).

Hi Priyank,

Thank you for the detailed explanation, and for pointing me to Note 3 of
Table 7-149. That clears up why PCI_ERR_UNCOR_MASK reads 02400000 on the
e1000e in the sample session of the cover letter: bit 26 is only
implemented when the DPC capability reports Poisoned TLP Egress Blocking
support, which does not apply to an Endpoint.

> That said, your suggestion to use "Header Log Overflow or Internal
> Errors" (PCIe r7.0, sec 7.8.4.6, Table 7-152, bits 14-15, and
> sec 7.8.4.3, Table 7-149, bit 22) as the example is much clearer
> because those bits apply to Endpoints as well and match the sample
> output directly. If you or anyone else suggests the same, I will gladly
> change it.

Yes, I would suggest using those two in the example, since they are
masked by default on Endpoints too and match the sample output directly.
This is only a suggestion, of course; how to proceed is up to you and the
maintainers :)

Thanks,
Daniel
