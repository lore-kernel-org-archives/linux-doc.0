Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804349;
	b=bdmyfulSp37ulAwUKlZxVq9ajLjzMoAyCM70Y4ObMcry4eMsFOTnty7b8886lCTqDRhC
	 d7pVO4b/AnO7LGadO//R4yymRFY4QDMhilJme8S9MM9ou7WMi3jfkIK6aEY9/w8mWDGry
	 q31W82nnzr7IaC1qRfxtktg/JHlkh5MuP6bOE6XJrznfBqAEGUAw7+vghpK5kPR4Qugyu
	 PUVzy7sMZiseTXomnQozEiiEmI7OYradK0PIkEgQMhd/FylgOVM9xmttgGJNpjUxOYka2
	 1V7fhyQsqvcJ159EXCbu6gLeErbUAxIdihK7vKhcWjbXbA+cLiwZeVkkexL1pgO4+NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
	b=duni8r3fX5gB2Aex4s1l8oK55FWi0PjBwEk1fvAW7o1OIdQnIO1E1lefCk1DG4HG0Coc
	 3LiIjNbin9GHkr9Bs8YUwOogVR2ZjME0Ey0G9/Jp9Xq/ijQEO1Pjz2O3JKgOwbTMyjjcB
	 pCR43jtfAaReg1Bwxx3DZa2qIA1e59OGk+FBmsaCCJFrPTaqim92OnqUBEig4A6rxPhK8
	 AEke5ANSQPZ7qxSz/fIpCZa2QYmaZI5C9HOP1HK4NIslmOTJWWFN4v6OqHlkz3LiUy1Vf
	 Mu3yYiXk6IbbIuJuhQlRxB70pWv4MBbxnfC/VAVQSI9wFzhV7EUlLiT2+AN1/dQgRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=evalinux.com;
	spf=pass smtp.mailfrom=evalinux.com;
	dkim=pass header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=gAF7700m;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BC606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 14:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=gAF7700m
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de1fd5f572so329070eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1793804343; x=1794409143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
        b=gAF7700mkg0MgjE7QcFfit0kgEiol5BK7FjqB/jMsx/yv3o1/HO+qcVuNUImPd9YgF
         Jlr3/hxQvUIUjpDIZsPrr2cJg16Yx8hZPnBaCbVgcov0maksQ84D8S8L/6fTLf+nAZ9g
         YqFkuqqyqtKP3jF93Jajjp+DfgCkTOJsVrq5olUvWJYWyk+Sr1JIiHp8sCitojeQJc3W
         NRzvGMoe2oJtrDXth+O1NfVUBhm2aSOjPTW2YdtbxvLRzhhv3ehInxOurUUt3/hutFNz
         9DdhBWw2J+/CpE3wLu3Go0paJV5dEpzmmfNld4KNlwHBj0e2g2SEim0bNwxt4VxT5eFk
         qtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804343; x=1794409143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
        b=jrMjSB4Cx/bo//plhMl0aHxOfVA7IE+7EiKKhbjVikHEy7PdG+LeI5OyE3gEMcf7OY
         3Fk+UrUSwVvNyWXhpD/cKtI+jQnw6gWftk37I+HnQi/91S4cKq6h89QMLrJxGpMdM7+J
         kGv5/eV7SFHsqrB26oyZVQDKoNEcicpunLOXXRhQuHIA1eHYWQyZk1X0KtHQL+swKkY6
         C+FiuEdeJ3iNKb0m4H9fsna8JafP9wuxghbx6fYel4CXZVdGxC0gK8ifplIqNB6LLyyF
         lyp8IrhDES3yV2q2h935/Uv3EyfmlTL5/6aOpSm9QQqMh4xntb8AZVLDEh5a04fjvir0
         PGKA==
X-Forwarded-Encrypted: i=1; AKwUvByCQYqv4wm8mVBn1Fn9h1vD14Mt90lJH9aBkW/QLrCaM0oe4ca5uXlZ7j8e6r92zkojc1gge+A37kQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SiRfDLqcmiwWi3Cy/U2487OKpvVlB+oihIFklBEdAWIdvdU+s
	fEoM1ubzhTtmGx3eeXLp+fN386Yr7KO45+xJHZL9RDRbZpN173LkeAgugbFun/07/hI=
X-Gm-Gg: AYBFou3FkWd+4MKJw4Iisr3rHJdY23ihfcQdEu5Kz8h4FGziV86tmcoifCE8D+dLN13
	E9i5XKVU8d68E9Dw0bVpTpXk8cAEktycUiWF520IxNi/ToG1lIGX6zI/DMjmiN7l/gbxSY3ICOJ
	P0+HbS6RKbcXlj6zHAkJLpks5LV29rr70rmSoGUQCtp5TjLNGZj1ex1hShUo557LLwMdR7QiOsL
	zusupl/MpViaZ1N5hX/uO2Wv6C6qY4RbTK3b8p+hGwrQnpzMMX8+HpqvrirvmGaUeutIkUcvkVw
	QVl3O5jmmHGoopM0Afwwu6e/HyLGucw0xuQLaqESVPuAtQRq3DCNSimhQOaSZDjIzpkklxzsDuh
	dJlhr4/PD4y2lxe4l9GsgKNDdcNICTZiVgBN8ujGgTg3F7srZUirT0cbTe0Ep3MVxQYuZsrns8m
	mfcO6yeqqghlvoSMrE3hNUqMa7oPrJdk4glo1kjkfo63rIVedSlLYZJG6TR/A5FH0BfYviN0fg4
	YKTlTO9/7YtBXUTHRaNwSE1KEekGHBurub+zH8kVv7eccc13fHAn9A50gKmum07at/+8dlb/UYv
	vGY/2t9cTBuwYfiLtxW2bGU4Yo1NvLWFmTIyuDk/roRUx0vhuKMoHQEDAaAYfna3/zZOWr1uFAH
	R2tLNh1DgNfJ+MilU
X-Received: by 2002:a05:6820:c3c9:b0:6f9:91c9:4e55 with SMTP id 006d021491bc7-714f29730fbmr5644169eaf.47.1793804342753;
        Wed, 04 Nov 2026 06:59:02 -0800 (PST)
Received: from desktop.casa.g02.org ([187.247.185.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3dd8e0bsm2019853a34.11.2026.11.04.06.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:59:01 -0800 (PST)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Weijie Yuan <kernel@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst
Date: Wed,  4 Nov 2026 08:58:59 -0600
Message-ID: <20261104145859.766328-1-renich@evalinux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <autEFEW15g5I0oVT@wyuan.org>
References: <20260920073144.546566-1-renich@evalinux.com> <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn> <autEFEW15g5I0oVT@wyuan.org>
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

On Wed, Nov 04, 2026 at 10:41:24PM +0800, Weijie Yuan wrote:
> On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
> > I have proposed a patchset to revise all the inconsistency between the path
> > of Chinese translation and English documentation and these invalid original
> > fields.
> > 
> > Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
> > networking/xfrm/xfrm_proc.rst translation
> > 
> > https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/
> 
> Ah, I haven't had a chance to look carefully at your series yet. Then
> this patch can be discarded in what's-cooking.
> 
> Thanks, both.

Makes complete sense; relocating the translation to match the English
directory layout in Dongliang's v3 8/9 is much cleaner than updating
:Original: in place. Please go ahead and discard my standalone patch.

Thanks for the review and follow-up!
