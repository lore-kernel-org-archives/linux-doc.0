Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450642047D
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006690; cv=none; b=iPwBT7YsPEetmOZbhjDXL/L+umTJemb/YEbLyFkMg8hPiI237FAeLqqUbh5aYC/N9CAkOF3ZdmHcVqhL38NedU1Grs1klhS7/6JhHrD5Xqu59OrxXymF/AvXlufTaAQP7d6MvrJ88RLOSshK4MOKkqDMXiPK+QOPNdxBPIq5Yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006690; c=relaxed/simple;
	bh=zHpWGka+ufcQu596oiXlwyxCYMcXw993zHcRy5fwPA4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:Mime-Version:
	 References:In-Reply-To; b=s3uEbnvV4o6S5CcZr/jXzEUy2PWHej72BO+jd0ZrPnyZ8GeuFoV1VCeKYMTa48oG+cwrwoRPOTxPKP1tU96GBRO09+oA6YR2NNoVRlI+u63lWk8wk/AD4L96DhFQ3wyTVoqTv73hm00UcFxCDX/IHgQHcBMrTZtZY2pujw+pIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BdWA+hkc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BdWA+hkc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D12DA1A13E8;
	Thu,  6 Aug 2026 08:58:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EDE6602B8;
	Thu,  6 Aug 2026 08:58:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0308E11C35CDE;
	Thu,  6 Aug 2026 10:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786006681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YZ7NCykqyQZ0N4K7Wxs0sGk88c8nsYIAuKGVNgBRR0A=;
	b=BdWA+hkcp6F/XDImNzV7Fa07UIHgrovdaM3iBsFyeZBFuGibrnNGiHeuInUmF2PAB+5wrO
	ZJJRjmUyiA5GT/i9h6r6JIJXNio+SuO+Ye3G/UQKl/tsihBTmoC8HiO18W7r5FCpFkLMGw
	ovHf8IeHllulrVBLfBiUwr69s+Fm2lEdC0UqUVwng+yGyEuMYLmuC3e28CSaiPF6JaotPJ
	YMNxkeJodw4SQkc/eIAKy1h3qRgCFSDk72PbFNpKUbsBoen9OcEzsGDV0F+fxYu18VNFz1
	fyETZdwa4pQNqg/tzDSWWsLTyzAJXgy/7qURaH6yDiK0/0F9f5FnwxsxsJ27Eg==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 10:57:57 +0200
Message-Id: <DKHQJ0PPTQDW.3QW116ZQBQJMY@bootlin.com>
Subject: Re: [PATCH v2 0/2] Documentation: html: show sections in the
 sidebar
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com> <87tsp8nyn7.fsf@trenco.lwn.net>
In-Reply-To: <87tsp8nyn7.fsf@trenco.lwn.net>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Aug 5, 2026 at 9:41 PM CEST, Jonathan Corbet wrote:
> Antonin Godard <antonin.godard@bootlin.com> writes:
>
>> The current sidebar in the HTML version of the documentation does not
>> display the section titles because the toctree directives in the
>> top-level index.rst document do not contain ":caption:" properties.
>> Replacing the current section titles by ":caption:" properties would not
>> allow having text between those and the table of contents.
>>
>> To workaround this issue, add the ":caption:"=C2=A0properties in the toc=
tree
>> calls which makes them show up in the sidebar, but hide them from the
>> index page with a custom CSS addition.
>>
>> Additionally, make the section titles in the sidebar bold to make them
>> stand-out.
>>
>> This makes the overall structure of the documentation clearer from the
>> sidebar directly.
>>
>> PS: This is how I've implemented this in the Yocto Project
>> documentation[1] where I faced the same issue. See also the index.rst
>> file[2] (which was by the way inspired by the kernel's own index.rst)
>> and CSS addition[3].
>>
>> [1]: https://docs.yoctoproject.org/dev/
>> [2]: https://git.yoctoproject.org/yocto-docs/tree/documentation/index.rs=
t
>> [3]: https://git.yoctoproject.org/yocto-docs/tree/documentation/sphinx-s=
tatic/theme_overrides.css#n106
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v2:
>> - Apply RB and TB from Randy on patch 1/2.
>> - Remove whitespace before section title and first subsection.
>> - Link to v1: https://patch.msgid.link/20260803-show-sections-in-sidebar=
-v1-0-b4fdc847525d@bootlin.com
>
> You didn't answer my question about the PDF build.  It's easy to break
> that build, and easy to forget to check it...trust me, I know.  I did
> check it, and it all seems fine.

Perhaps you missed my answer on v1:
https://lore.kernel.org/r/DKG7P6BAPV5Q.1UO4XWHZT8H15@bootlin.com

Thanks for taking the time to check the PDF build.

> So the patches are applied, thanks.  I did tweak the CSS slightly:
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphin=
x-static/custom.css
> index 34aaa424a75c..6c03dca44c82 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -87,7 +87,8 @@ section#the-linux-kernel-documentation p.caption { disp=
lay: none; }
>   * Make section titles bold in the sidebar, and decrease their bottom ma=
rgin to
>   * group them with their subsections.
>   */
> -div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: -10px; }
> +div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: 0; }
> +div.sphinxsidebar p.caption + ul { margin-top: 0; }
> =20
>  /*
>   * The CSS magic to toggle the contents on small screens.
>
> This way more directly expresses the intent, and will (hopefully) cause
> things to continue to work properly in the face of an Alabaster version
> that changes the margins.

This looks better indeed :)

Antonin
