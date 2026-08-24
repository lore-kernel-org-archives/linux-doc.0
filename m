Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530E3806C1
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787594754; cv=none; b=tcmZPX0zxeRktXsA2ixnCB99+LRA5YxSmKQgr3+vkcd8Ee6LsfP5YlBgVapTOsdsVo2inj0ffRgzvN9mFHwKUtsNxNav3un87Z3kwcjHpHp6E9sTYV+aPMmi4Dwcdr7TBSK7sB2+0vb3I3HGbNlSFa6+QwLTz5EdtrX668JpSLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787594754; c=relaxed/simple;
	bh=xGiwPdvHDaT6263LxW0HA18p1Ey80qKzK5vS7LyKl7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uzlw0+bDz+52SvPbBpGF66YGylBIRo1ZuTcyGO5fyyBOFwuNd5/1g81T//nwxH/TD+qDEQS2sCHLonrkr1YSqBJqkG0xRaOGGfiqvtcymuomUjbdk9q3LXZX96n+ubKQJBmPOMzgJLdx9LKDOV0LWnBLjzqW5vk03GwpsV7Y4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKyk+hdm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKyk+hdm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1671ec8692so550104866b.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787594752; x=1788199552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skoqjtPPtwdZssqxTpwlEMpAUyL+jz9BG2BggOHW7M0=;
        b=iKyk+hdmx5gfmWbOhBcMT2GMeesr5IckXMIBAdtg14ZHd26AW1bOITZJ0fEAmbsFip
         brLo+nipi/vzBrsAFjJaZUDiNfNXkK32l/07RulswViEW8+3gAClW45aqhnfm10qXRV6
         cM8uLARucyEB4pvQeuwS0nXLfQ8mzxWER0bGr7P0BfvZuFkPg3zsaXA9ibgWcjuzwxXL
         +phIoM5Vm6OI3mt1skgGgJbE9WArFVf6sY7v2eUASOFMQWzobHR3nVz2OkDB7D8yjENB
         QACBIm50KnWmL61BGd3nGNhB3/LG1al8Bwz43cnIL03mAqWgCjI/uMBVA8SK1uanXvRi
         zBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787594752; x=1788199552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skoqjtPPtwdZssqxTpwlEMpAUyL+jz9BG2BggOHW7M0=;
        b=jWSPvItslURUX+c4LMgXhgs38kh1SZ7uyhxKb8yRx6LktUL3xlLKOZMHr6YNITbrbp
         FOJgzxMS96FJxwAgAsPKbvIQuKR1P0whDp9tq1rmKP0EyLVdDqV4CZNgTM88MMfQc8RF
         eyPyIEIXZPcArwNC3+8JW/EBIiMUOU7V+8QqNlKtFsrhIJ+zrCp1/3HKxE/UXtTixXbr
         8RW9CvYtPLietSqK/PZ72E6d2wDxWtT5NbzutFkMYsiWCeTvhScYLQE6h28R7pYop1LF
         FwF179B7O8BD8hGwx2He2izoBYd2ji/B2FqfoJG7ct8he82dGfUYSw+NAYm0gx2h0UxP
         sP4w==
X-Forwarded-Encrypted: i=1; AHgh+RqwWZz384BaAXLcnqI1Kx+9L+4I2LACHOXb9mnRTbTsOvcgYeHyKGu0qJMotLLMqiyFhaNE3hrzzsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n2a5oihqrH1RIQgjN9XzH03cBbIJpit+OmqKWHpTsR1Ccp+6wq
	CauGOO5TwsNl6lspfpjT/lTO55jBtXYNv1F1GVs8K1xKrfKgadElDH8v
X-Gm-Gg: AR+sD13eQgBLaM/b4qT3CB2Sjqfr+/OehWYABC78IGhDUVJ4awqWOZ8hzo9gq/6af0L
	/Bzo9q0dE8VTg3uckA0XIwh5SyePGRTTLyxhrPgSqVQk6PFmpLMufMW82FLX3DTm+HmMf8lW2gK
	AE6/cBq9tiQMyr4JVNe9WjHT3KoCKEg2ce4jj4aTN05AFiZX/eDKo/+0sTGUw4Utd8HjV0MyA5F
	MVfs1lGyZwT0y+m8pWLLXK3iJe8uVkezEbbkZ9G9muJoUnNE8fPDFP5c4IPVaqFeN0bsMW+9/Wo
	VUHjfTJP+HzbeNX5fJuoVRx1nZamzOR5S9QvOjxXpWssew9yYe31rwBxGTFii6/7iTrLfSCIlNA
	UNsd4JayBs8/XITaQ/4ntcGB4YlqjmQQlcEKF5fgF3AZe5dtE4DIMOle7eiaVRfVRpMtfhfXIwK
	a6r4g1417Eva4cFwp6FZeFymLnKfKTT9McXarLjsBA6opgm28+hTL2tWPHcuU8zKIfVqrBd7ndD
	7bUrkKUkeQR2ldg+QpjRQeEL3aXmK0p54pCKH3XdJJ/C7pnj0DdhTZluOd/VwL0N4nRF2i0mmEc
	3h69NvzxM6N4vTx50yRzSA2Q9HaLLu6lbqzqvz3/UTjaUHaPEGudl6jKxxz13rXRb39zoAk=
X-Received: by 2002:a17:907:5c9:b0:c12:83c9:d41 with SMTP id a640c23a62f3a-c2491e83838mr1910315366b.12.1787594751528;
        Mon, 24 Aug 2026 11:05:51 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b297-8e01-ed33-c55f-13fa-4725.310.pool.telefonica.de. [2a02:3100:b297:8e01:ed33:c55f:13fa:4725])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1544512466b.12.2026.08.24.11.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:05:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:05:48 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] docs: cpu_hotplug: Fix multi-instance removal calls
Message-ID: <aoyHeSsuikpMKjr9@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-2-kmehltretter@gmail.com>
 <87fr03zcb2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fr03zcb2.fsf@trenco.lwn.net>

On Mon, Aug 24, 2026 at 10:57:21AM +0100, Jonathan Corbet wrote:
> Karl Mehltretter <kmehltretter@gmail.com> writes:
> 
> > The function is named cpuhp_state_remove_instance(), not
> > cpuhp_remove_instance().
> >
> > Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
> > Assisted-by: Codex:gpt-5.6-sol
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> >  Documentation/core-api/cpu_hotplug.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> These patches could really benefit from Fixes tags.  For this one, it
> should be:
> 
>   Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
> 
> Can I trouble you to fix the rest of them as well?

Fixes tags are already there, above the Assisted-By tags.

Thanks,
Karl
