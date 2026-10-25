Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937980;
	b=mScFlPAwYTyVqDdVl0zN5N7dgi3eM5VHa2dk6iCneyis05KqqlAAmawW8lphq7fg8bh3
	 CU8FlTb8cYeJYOwF5vNy5xROgeeVi/dohf2NGQecgfFFP+yoZx/Z9hfAeISSPRfeH45qC
	 x219jvmSlLwmXaJ8y1oJ1T21CFD1DP/72cPG614oXHjId5cifVEI6kfoJdqVz/t0LL0on
	 JM7KOPIfzlHQGhAKHyjuIXxYnVKwPuBqa+vzgDbnrMgpcT0O0E9PdYBRlcBVW+6OZYngM
	 l9BJmYLrF2thxChttV5XhXpKFs94g/5TLmpgU+TzAdxJgNYp3c4DFxNKDSY62PyjlYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
	b=0nNxhbO+IIAqizdsd5FwlN2Ka+/5BOUEq0Wex8LKHCNvFiHEvW7fWR74BahSv9Gmov/b
	 2Isb06jm5dhlBZe7/6fuWRXIYUAkgZnLCfBaudPmq1EhwA24LusyMAgrBVmYIfVE/WVwU
	 TDYWGTHoJSISZDHCczxxHDwIDPxQGTBKUKyPRHaY6stRxCPV5pfZJbeafU3gv8TOSiS2K
	 Nnd1b2HOUo+JmuxDZPafRK86oUFtNbhQ9K8YVjTS72SRbhsL7QfKd+kS/g3e6xll7oE52
	 T5v8b5DvmRNtYmuPjN8SBVmA5Jzkx0HekwMKXofNSJrg6wWFo3sbRYZ41jC9v0e8nwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rpwWsubX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D72606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 14:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D72606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rpwWsubX
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53394bffe0fso37455541cf.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 07:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937979; cv=none;
        d=google.com; s=arc-20260327;
        b=KhMrBH+5jOD9drv9odmZy/FMihmCUHkCYlHK+RyxPr71TcUf/T+e9M5266HTWh93WO
         RQYwNfmNrbevo9ITiGF/c3Un4riDuPKz0H7WUgqk5YZ2Sr7jVyrhpZm/KPD4W214vhG3
         ayMw9OMLIvzDujbxN8y7m64B4Pm01kiX8C3Haz6jBqhsIJstwgPQcmDarlZaX3w2ALPw
         cwRogO/9ycp6fNvRN3UyBcDkBTUkAps8258Rdzy5cemk1zRj9PA3zRDWm0j5SFUSUVIO
         M+NGwOAN2mMYZQIOGVgfnyMZ1s0+7Ggl4EndCerBtPAz/lQy7lek1rE9ilrqIgoYFr6O
         cuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        fh=/2qkVE6O00Kv/1KLyZyuUXV7+BvIHU7h6WgpSdGB3mk=;
        b=m7H8RChAFEwd0kWuyZzo+moiUIkodXzyGTT+fqDbw9R8V7XTDQyBiL2v3RXwEWk4aR
         rv/zhELs+ZC72MBo20yLYKW+WUI4jjCymuJW0gFP2hKiLqEn869L8iIbsmUo6CXI5wHX
         oi9e/hcIjeAu/wxtCQpwqJXaBwpmNaihcskI/t5yWbjYzIZbSkc8wtOmLjsvNIRXUJXB
         qU/ehInzsdUVzSiCpULNhRF7M1O4SMZh/zfhnSQIc9nVs6ABMzlgKNnPu4CXG+ThDY+a
         9k2qV4CtS4n59IuPAZJWglPvPl1iXo+l76TlGLecIUSFpsbyfhck3WN1e6sO/af4eZnh
         ui/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937979; x=1793542779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        b=rpwWsubXievo0YLcf+Vs4oyL3gUbEkkg6C/OnQYw2QmkGoL1qKvYRJywg5ShhEZKOy
         MisnyD6P198DHVaIT3z17H+r3SCXdXNuADpOlnmAUbMHDbljFh7euejz4u+2PeIJGXm2
         j12GCrd6aQ5Gpp1MoNwrET16wv3oSBf2kipGQ69776/FBPtADAwSfOQDL680cq0s43BK
         /9uMfVW0W10KZBZjigT/5ww3s+CfO4TlIAn+ErZAbnshbSf8Qc+dABZhxFWn11iXxoSZ
         AJbi8CHNQkmbDv6KDkZkYhEMKwn9xLgzYHihgLdHZ7Ez9OJZ4z12mPgj9iIJDDLr/bjK
         d4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937979; x=1793542779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        b=2bI6tZ3kLNsB3TcLfKJkNbABsO9xETtu9Q+bLRrpBGNMF435IRLYqTYV3O8YIJxirH
         lQ5kvChyps5OTQDqVYmDE056VaFa+2w3YfiJZ3NZcidNJyFPzALsEzHIPRvINrGKAJtq
         BfsufjDGP8WvBiuX3kYVao2dXfB6x78sRpaxTjFk420AZ+rhRARtrqqEGq3gyFk4RPxu
         RSyubBkTKbTwkUjSH5vPIqlCpcz0+7+PfHbCCMOiOPAjhZEQ7B0Gkqb7CnJlyCsxgpmH
         qyZXiBGltZqafonwPImBAo/pQstYIhPiUVrATcvvIpPaMv3PVAfHfBtWTErxZAbVHfPp
         LSkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO2fGJ8Jh9yUYXe4hhG6Iux4syYf/InGKySZ9ETRN9mntEZDljrX2fEcZpVowNkN69PNukqEj1e3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM1NsOGnvF6OvwhL6dMOaEx/dD8ObOK8it74k1M5N2ar5CjB1D
	Xj0KEtiPJHYZFCyYmN1JOKyw/wG8pYVlCSRRdr4afT74FCPN9Pi6ZXZQxbrVumvRRvraFv/I49T
	bfFsbOH6PSnRTdiNHIohgfSwiQ9YHMgE=
X-Gm-Gg: AYBFou3skpw1FD+VnbD7pDlrpjlUOeXXihKJjzEtDnprw6DWjdk7fTjpOwiaqOHNvAc
	cT6H2bhupjl1Ag6YQuK2WaPnMIeUVCBW3W3Tqs+eBDBbozck9mokyMhS6xE5aH0wfwHJCy7vSbj
	CSr4idoMNvBANhWu4S1IwMFgh3/RtyL0hWRwtAZlA0wRr9pZK1oZgln33a8btP176TOz8FPR84V
	qcJXpCng3NAJQnn64q821FyqX3UpfNI36MG2ljQUaPvJGLqrklAbSfOdejxCD429wSRnppJlGTS
	+a0w3xV8zxFT/daRtGS4qWt8Chk8T874gZjcEc9a8H+hv4JJpFkQSxErhqPz5K5+Yc1ONU6B/GR
	vdXHrWbnHcC6yfhrlNyw7xCdHVVU7clPY3RhJe5ofPLQU0OGXL/6eubGl0UPMV0NaAMOmNPWKZD
	qLhBruPuijJ2vjNTPuzhB4kXMZM84tT7/SUIhkMyTMmOrAvLonEVLwMZufirYetRZAH/SorEGS
X-Received: by 2002:a05:622a:44a:b0:537:548b:77ed with SMTP id
 d75a77b69052e-5383b66676amr59161561cf.30.1792937979282; Sun, 25 Oct 2026
 07:19:39 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com> <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
In-Reply-To: <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:19:28 -0300
X-Gm-Features: AclHuK8BBiPLOfqYYGvUYpW8KblsSf6Aue6WOkhnIkNSO4BT_qaP3xQuaMz486g
Message-ID: <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com>
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

On Mon, Oct 12, 2026, Priyank Rathod wrote:
> To exercise the handling of such errors anyway, e.g., of those that are
> masked by default like Header Log Overflow or Poisoned TLP Egress
> Blocked, load the module with::

Hi Priyank,

I read the text against patch 1/2 and the current tree, and it matches
the implementation:

- the -EINVAL refusal for masked errors is the existing check in
aer_inject() for both the Correctable and the Uncorrectable case;
- 1/2 drops the writes to the hardware Mask registers, and
aer_inj_read_config() clears the pending injected bits from the Mask
values it returns;
- the hidden bits are kept set in dword writes through
uncor_mask_hidden/cor_mask_hidden until the module is unloaded;
- PCIEAER_INJECT is a tristate, so the boot parameter form applies when
it is built in.

The new section is also a proper subsection of "Software error
injection", and the documentation builds with it without new warnings.

There is one thing I could not reconcile, in case it is useful. The
text gives Poisoned TLP Egress Blocked as an example of an error that
is masked by default. In the sample session of the cover letter,
PCI_ERR_UNCOR_MASK of the e1000e reads 02400000 before the test, which
is PCI_ERR_UNC_INTN (0x00400000) plus PCI_ERR_UNC_TLPPRE (0x02000000),
while PCI_ERR_UNC_POISON_BLK (0x04000000) is clear. The vendor register
descriptions I found also list that bit with a reset value of 0. The
Correctable side does match: 0000c000 has Corrected Internal and Header
Log Overflow set. Internal errors match too, since
pci_aer_unmask_internal_errors() is only used for CXL.

Perhaps the example could name only errors whose default is confirmed,
for instance Header Log Overflow and the Internal Errors, or cite the
spec section if it does say that Poisoned TLP Egress Blocked is masked
by default. I may well be missing something in the spec.

Thanks,
Daniel
