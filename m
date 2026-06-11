Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426D4C6F0E
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202333; cv=pass; b=rI2TSBN4QNVNIi+ts/ja4HdaQTDCc1hoUpkuI1ub4Se63W7O04yXxirIezLlseEy0MqEeK1lA4zFwAfFjRzD2okTkZSRgbFax4tj8Q+kkG4+SP5ybwUcG3+3GPujrCEk5v2X8wN/1gpraejgU6WdLbFWltZ5P+L/al4zkdOVJBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202333; c=relaxed/simple;
	bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jo/Jrn1biRJlGnjXL3XNFy0vnBbF7Vqwml1SY6E32lRQTLacONrlVKQ+U/uVKo9QcZFg7/ZcbWgvKk47xx85JYBGQn6f9upmWssjSrzTie6Jk0TOdpnhqOwfloLgs+cJHDkKw0YY4GxePNjr2zpgNiJXzaoDctADJ1bArDgYIAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JHkfUxzF; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHkfUxzF"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51765531803so88591cf.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 11:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781202329; cv=none;
        d=google.com; s=arc-20240605;
        b=LQvBYOHrxzUX3dESqsBPStyJpo5wgypMXa2M9HDOoh+lV7IstLia+9xHhDMJwcQlke
         Urq6CR1vV3j1f33iGFvGSmpEbNDuEm7akmUpb3ybyroW4vSpWtjZcnoiWEx+blYN+Z1c
         qow4jmstqZJwalcIPchfHcTbtlJWzeGj3kQIrBqNNMq3obNcm+S4cbxjrwrxawZz0aDW
         AD49BHwq1NxQapmp8aqpBiX3r4CwOy3311IXrF8fg1O8cDC8PrTpcd1p+fNNs7xyIVAh
         q5GFNMV/n9S9taSjpjo86+I9qcRRyJFmUFsHIiaiqGkOnIplbPVm1sjzLqvZAR3c3q1U
         HHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        fh=M0f0rYx2BgoKNCFt+cIpBhekOQcQJ969Oiusf7rWIcw=;
        b=fpY3yDHkaIpuxKlxp+7qN7y8FZdUOp87yg88LdEsFLPscWSeJe96eVt/f3rSW0dkJR
         Fne1ZMiNuWORiXpy96fGUIQIeSKIYb5VapffC71QumxVB/49ctfzQSiqjA8jVb3rxdoy
         mYU7QG7KyiRsJttpDjqPtpbB+pRh0QBg5WCZBar/QQw9m2JJNmGHxdyDDzshoSF5TJry
         3IHgaLmt95W0og53rLWvDEXxo8KEFSeFDpzESmmoD9lkN8tmt3K0xuGna3sTcEnz2l3R
         RTpdCa9/6jbAFagDXbrPfL4zrSoL74badkHWQCk6SHEhUqSX52i+7V3vyUcg0U9UEZza
         W27Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781202329; x=1781807129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        b=JHkfUxzFAAfrd8HDda146VpzErGNBBsdqAq5syikVd8seQWWz93p2GikC6EZIxmvQn
         JUQ8WHQgA74q0APZblxiqgqkY0lwkSePFBkTt3nOH8dmcB/ey0q9/ZtNIPkMungeseFE
         aLkJLbvs/xnaGDwk86u6AuQM0DWQyrem73Yl5X9Fz4vs1QRfw4MxBk6S2svOr8Pm+xK2
         F/F6UkP+WUmVKz0ZxpDzMgcT+QDZD0Mg+Jw9Js0hqjDxadOAIKfgBVyx5HnTx3DkI4Kz
         QS0Oa05yi9yPp20naoUsAN45X6Mvxgzg5zqAtIJDeJFTyjoQaTfxFuw4TC5syMZmVfwW
         pGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781202329; x=1781807129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        b=hTWZfn8IknwQjQf2LMjJ9MNcsW64yNVup1W0aMoW7ywYuQc+Id6SYYaJMb6UVuRvz8
         rTj9U/8DVGe2yDOnmWjc0fRIfjqUNm1T38hgQ1P4SVv4Kdp6sMRgvZUfrN683jChRDjm
         cgmgj7/eg8ksLGUy8G8ePbX4eIWP4QMCc52bcexKA4TEYa4vngpfWWzkTfl+C2828L7t
         8slgtXHhCD2bvzRCowFlp13+nx0b7cLoMuctRmXZ8NDeKo3wJOrSsABcPzxgFMSoNU4B
         yvc1hCEI5YbQRhdfj2qOkaSvZnr5dEx8IOMFPrS+gMi3XpfLEF2vw5hWCU4hWB/IhxC/
         ac2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wgtpkE06x4FNh+9Xdn2PGamvsLZvZtxOleRDOXS2hpi1WrvjMnEDdUZKC+IZ4stzOcyn+d4H4I/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlKFSqbjCkUgw+yfjBGrUmBuJAg/Go3kwu68nFcvc3puJzQCy
	s1/bUZRfgU2gk5FPBH1vHWsvj6T1lAZZT7OX0VVDUCZee2qhsAGdJQjzksHvZIWauL/G2tWJoSB
	Y7XmSK+r+Be9Qwi7hcGtsfJ+JGW3xE0lupd7wiiOF
X-Gm-Gg: Acq92OHwPQ0mYHd0jjTyYmKeiF8D2odULyLQvEHfwFicPHGa2CxhdzINKEeSd+sOpmv
	Wx/K9avCAXAiCfxR9gLTcO6xiBpts2n2E7ZGBPj/VYHbv73lej2bvETz+REoykebcTXmPVfw3Fl
	uXdv9VfO8TFcQNktYVPVQRlH+qyr8thH9p8UyYtwLlRn3sjBz42qxiPtFUUvu+//MhDo0RdboV4
	pARcyJnsreZGi3D0TSYmxvKJHF6BgM8iECcS42zvS9YO4CTSX+ZT10DgbWUZpV/B6BMz6KlpucV
	4Jm5j6LMKUFLfvhtnKHRtz6vq7Xlr5ZnFg9MUvBR
X-Received: by 2002:ac8:5d16:0:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-517facbda8fmr1217551cf.0.1781202327712; Thu, 11 Jun 2026
 11:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <20260526023515.288829-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20260526023515.288829-2-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 11 Jun 2026 11:25:16 -0700
X-Gm-Features: AVVi8Cc_4ND7d7yx-9ajFnqcQ8evQgoIAwHtu_wkSwUVPyjfFy-YFFdjIGUufDs
Message-ID: <CAGtprH9HupUdHmLJbxk0QL=8bQ0kKNw=j_-fpvfAKTf=x7izgw@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] x86/virt/tdx: Simplify tdmr_get_pamt_sz()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:35=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> For each memory region that the TDX module might use (called TDMR), three
> separate traditional PAMT allocations are needed. One for each supported
> page size (1GB, 2MB, 4KB). These store information on each page in the
> TDMR. In Linux, they are allocated out of one physically contiguous block=
,
> in order to more efficiently use some internal TDX module book keeping
> resources. So some simple math is needed to break the single large
> allocation into three smaller allocations for each page size.
>
> There are some commonalities in the math needed to calculate the base and
> size for each smaller allocation, and so an effort was made to share logi=
c
> across the three. Unfortunately doing this turned out unnaturally torture=
d,
> with a loop iterating over the three page sizes, only to call into a
> function with cases statement for each page size. In the future Dynamic
> PAMT will add more logic that is special to the 4KB page size, making the
> benefit of the math sharing even more questionable.
>
> Three is not a very high number, so get rid of the loop and just duplicat=
e
> the small calculation three times. In doing so, setup for future Dynamic
> PAMT changes.
>
> Since the loop that iterates over it is gone, further simplify the code b=
y
> dropping the array of intermediate size and base storage. Just store the
> values to their final locations. Accept the small complication of having
> to clear tdmr->pamt_4k_base in the error path, so that tdmr_do_pamt_func(=
)
> will not try to operate on the TDMR struct when attempting to free it.
>
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
