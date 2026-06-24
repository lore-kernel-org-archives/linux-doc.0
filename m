Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518C385D69
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288403; cv=pass; b=laDq7sntXsUbTzidb5Gg8MCqnwlCcscDrYy93tijnjXXRSyCqenQdhcl3DsLZYrvu2s09GP2XGLRzlGAG2ddi9ZjToyVI7Q6kiBb3xMYyOHBoA06zXl+0XycVkXmL2PmWjsCLfOOBoaR0kU0EYn9QdwW9Lc+ElRoWO0hUBr5oHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288403; c=relaxed/simple;
	bh=gZeNPuamGXtqBkLQzEmuZPlOeqKMujWLum9QRt/g1bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2PH+m/hYyl9jVtPYSL4caxn4NcUYqgR+L767ZP0DtSB+zYCi7Z36BGZoMHsST60eqyo/2wlGCY4E9tjnO+w2iQ9PayOdk8Dn5ZNXuHZjTj+nKIWvd7Vh8M4jA4z6BMEk7cSSPM3DcQJyfWXFUcEc9sOSdmp+XlHmmxc7Nn9HCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzYxjx+f; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzYxjx+f"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c08922c23ebso94419566b.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 01:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782288400; cv=none;
        d=google.com; s=arc-20240605;
        b=fRmMJM2gHwouZG1ENr7E1LLfiTbEts1U3VbxfLsNLlEZNEBu2QDhCsDsqxCqgG/AMt
         526rAJeNHTqx8FF+MIVKC38w9RITg1y4RkXzqq4GH5nS0gZYC52T4rbP3qODzrL47+dU
         6cOEOaE3thbom74c+C/gTbREdxbvI2+hsMS9XjTzCkra1lsGLeuUt4CcV2Q9dF55/8RC
         DPmywjAjRdETZLCltLbC/bKlaSRRGDKdHKQ56fUcP8aFRzDBZDvliGjYWXLBM15udroa
         Wskbmp4e5J+FSm0h7jbQ9EY1PSbTlSbuzHM0l6Mr0n3TLuaDE/v1tklCLnM0Dg0/cmNm
         Z6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        fh=ezAnqhq+Q/yIew68LKViGL4/ERFVDmkKbtgqzUUT7c4=;
        b=a/X0BzjWslLvhtorGkjhExkaZoYiGKr+UYX9R29aU3hjooT3oFPU43r04b6CSF1Vjy
         t0BIrDg9A4dhV90Mns/TZIPeCfqWlfGpVlhk2EqxOsoyBsBVMWHJUUPQqxAFLxPPSr9R
         XZueot2oTywVvSSo8QsyCW6ChXdBfJ/NojTgGky6BPjN0Igj8ZSw2PblsfD/5eLDoKpS
         qJJmHey3ewsd/6EXokltiXk5GprMWw6y/cg88JkMVV4PNqKM6MmcTXq7fanttLpZ2c8q
         fCHbnMiua2MhUqhsR9rWIVObvI92PrqbpXSX5H2etPcHufoTXHL8yMadTtz3O/orYg8U
         eB9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782288400; x=1782893200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        b=IzYxjx+f4Z8/We9K/7J6kIBnc5HIvl0pZPGjt0PCA/kXigCxu12jPdOVWcGNxvdVyK
         le0cfMTSELGrd1aLyBTP6pYgGScgfLU04A+24F0B6pv/D9vnq+35RwZlBlccCGvXCZFr
         UE3SrjCjoEweZGjKoK2Bqp/fDjb+CjnkVMLXUSB4xv7JWSVpFuu7B0Fv66RGcr7QM0NK
         8Rb0U5IxYYWbeAuCsCtBpY+Q2riaUJdnYOkrIDAiOSgOKMkMkpRU8SaoWGhNLY0EqE7t
         EMAl5Z/D5GX0h9L0L+zHv1H1oFJ6izYxyrlPJlzaa/8GvgX/Vz1MciPYBKvHqYGKErCC
         yxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288400; x=1782893200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        b=mboXF7ywGpHTXhIJ7I6gBb/zbARJIR4tR9Ip4lH6dYVUhf/6JMpzA4g1O6yMoaje7P
         7NGs9P5yjtBp3VPRyHeg9vNSMP2Tpjm6Hwsrmqjoibp9EhvygMKap2J53D8Wcwh+ayao
         WDPdhA+H44ZPEOTUO/QIF9OACFEQ5K2gQuVVP7xs4dOXXVCVBKtbVtr2KxhA9AdZIUDK
         J5voJtPiBtWSfofcrQdm/KtM1CqZc+u3NYP2PaWqjRR5B/9qpEAsaWakLbKPzeY+OKbX
         cM6rXHlNodkWFPZxyGS+Y7XfgCXnT8+99BH4cqnZ5lv7b0pjcYQeXZkN4O7qF4nCkJvD
         zFkw==
X-Forwarded-Encrypted: i=1; AFNElJ/wZGmXetvadklw3ysN++EmXdUDEj+TFiEsd6JaH07q23ERBmggZxHKb8/4PyGqeutIdfP5dtstNjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YymMGluWM07bMIszGek9gewpLXFFizifF2nqX+cqemBband6ub3
	CBYXNs2IJ32/tn7bXJtbc18XbMLT0NPsK300wfdMHfh0EcYJAxFfsGqAPi4HZ4oaeCOhZEegL7t
	QJZ3hRSKz8+K1OnuXLLhXRobCcFg51yI=
X-Gm-Gg: AfdE7ck18e6bsCdw/RHeVl9OABTiMAIQRpqgkPOJqsiz/ZVON3FhMLgBpwb98GmyVpg
	vBuK5sNkmc7+DzKdvKc0l7/wmX/sBIk2vvFUxgWbIviM0D7QnNZ+lgo9gB/8l0NwK7A5I+rw+3K
	wk11Vmxp+QYhXQ5qNOjT+SMjDfcdu7jSoylU1qo3+oXgKUR5iHnssLud0Dq2GMg6SB3sTicTk48
	m40XEBaAWrUOgoswBCqeW/W5jVScmP6fwNmFKGxGP48mOU/AlXZTWIaxQ3dNnxHsAZAB3xcGA==
X-Received: by 2002:a17:906:9f86:b0:bfa:f563:9294 with SMTP id
 a640c23a62f3a-c107e0dfebbmr347805666b.18.1782288400043; Wed, 24 Jun 2026
 01:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com> <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
In-Reply-To: <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 24 Jun 2026 13:36:28 +0530
X-Gm-Features: AVVi8Cdz6KHrxpF6FVDarjMSsiC-uOJ-UdMHqIhmrG7YgFP-x12nJ9Fo0j02HUE
Message-ID: <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Actually, the best approach here would be to put this single change into
> a separate patch that comes before the current one.  That removes issues
> of making more than one functional change in one patch and improves
> bisectability.

Before? Shouldn't it be after my changes? That would make it easier to
justify the changes. And just to be sure, you did mention it does
align with what the intention of USB_QUIRK_DELAY_INIT, but it does
change its behavior when the quirk is not set. Atleast from what I
understood from the documentation and an LLM's summary, the device
needs time to prepare the full configuration set. So, does delaying
before the first header read really work? I can't test this since I
don't have a device that requires the quirk to be set.

I personally think adding a condition to check if the quirk is set and
then delaying before sending the first request would be appropriate.
What are your opinions on this.

> The style used in this file is to indent continuation lines by 4 spaces,
> because some of the continued statements are extremely long.  If you
> want to align new continuation lines with an open paren, you can -- but
> you didn't even do that in the example above; you aligned it with the
> space following the first comma.

I will make my changes more consistent with the existing file, i.e.
continuation with 4 spaces.

Also is it fine if the string lines exceed 100 columns?

Also, is there a need to check for krealloc()'s return value? Since we
are only shrinking the buffer, there won't be any moves or completely
new blocks (at least as per my understanding). Do I still need to
check its return value for completeness' sake?
