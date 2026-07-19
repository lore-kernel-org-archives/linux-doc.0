Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB583238166
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784482872; cv=none; b=djHzSD92nKk97IzMZLL8afILjX+eOE3io6gOHei22vg8xh3V9Rm85MiQTQDv8kcS2G+ZeUZf0xb26DvIUCjqnvUpiG7c1oHqKtfFv8KP/BOpSsGEqJCV9K0TKLYTCV3zqHTL2jY4+ItFCaMGJ0LOlLdLZ1Z70owDtSCCeyqhMJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784482872; c=relaxed/simple;
	bh=K2ByV6O1b2SrNy8gl2EfKHRlMsn+AoiK7CB2Z1SwQKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkju+qnDVsEoJ/PR8OZrBsxQCpBy8JHfnNyndKXLO+T/tl5LO1EMiZii1KV2aVzcklic8gFcXS4ipyGFxSKjzMOjiOFuyIkGq8YDakNnsA745Vije7fVHI3slGBsBii8SwQIg30WWsNwQ0NmwXqRZiMSgzvkCeZNZ+6bkVTpDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UUSNUPYV; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="UUSNUPYV"
Date: Mon, 20 Jul 2026 01:40:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784482858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKOnIvxDylOX45F21owzPtxIo+7RWfs3eqBU9NQ5pF8=;
	b=UUSNUPYVAf+8rxhaEZustoOJs3/FEsx26PEZ9YtrOaowKl7U4l3D5fneL94EYu0ca0aVL+
	YVxhm8OjFk+4jyxjub6W8xYwyMOJ1weSHKWJ3CydMamFLyQpwCAW5lmBOnUzjoPffgJyAO
	cKXHfzvlW2GgYkGhcPTqkB2DW5c9A0+g2PsIAufFVEFcLyjGVaIfFC0/LMbk6ktaKqtUls
	9rqN7DfcLtpMGj0YNZI4JBAaI/jsC9gu+712/tYxxawPuUrPNK7WTbq89OOUUHsrdsOZJv
	LZobFb5nGkcsiIzyXLxKgG2dRU0xP88EzY2MNI/6u5JL4+snR1q8A+ls7LEo6A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v4] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
Message-ID: <al0L04hFQgQoCqAE@wyuan.org>
References: <20260719142002.182921-1-weibu@redadmin.org>
 <b24cbc00-73ab-4989-a0fa-f77cbd8e184c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b24cbc00-73ab-4989-a0fa-f77cbd8e184c@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 20, 2026 at 12:18:04AM +0900, Akira Yokosawa wrote:
> On Sun, 19 Jul 2026 23:20:02 +0900, Akiyoshi Kurita wrote:
> > Translate the "Include PATCH in the subject" and "Sign your work -
> > the Developer's Certificate of Origin" sections into Japanese.
> > 
> > Keep the DCO text in English as the original certificate text, and add
> > a Japanese note that the sign-off refers to the English DCO text.
> > 
> > Use a reStructuredText note directive to make it clear that the note is
> > specific to the Japanese translation.
> > 
> > Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> > 
> > ---
> 
> Extra blank line under your SoB ...
> Please remove.

I remember that 'git am' would remove the blank lines between SoB and
'---' automaticly. But that said, it is better to do it well in advance.

Thanks,
Weijie
