Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991AC340406
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186223; cv=none; b=r9RD5kVVpxm0/6FkBHijh9f6lDqaUl6QqPljBbHcatLGqBY3sJhsYqS7zd3Q/kJV5+yytfEMKfWAs922frepRtj0v29UA7RJYuBwT37i1J9NFMJIkBJDSuCcZdjFCdto6Yd8g3BEmRI43Ek0T8hDpuCHUzxXiGFjmRyoJwYvj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186223; c=relaxed/simple;
	bh=5wFA45ix2kFL0vq42scAgYM/zl1QiUa8lfttP/Wv2sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da+6/7rsgcM2IaeafhSBUoKbFdrksRxi0+yTPyNJMHWdbkONklqD0nuaX6fxgGcg+ORiEbeHEeAjXXNI+0/DAJQBYkTqXkGorzaV/waJh2qEetKVJgfe50P41/Z37ojS5AoRdquRjT6zWPy353+WJW+tLoZqXBvWkpFKznlQdTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=bNTQVk1m reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=hCSdCW22; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=n+XSNepU; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="bNTQVk1m";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="hCSdCW22";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="n+XSNepU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1788187118; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=L2qPTywjE2JdszhljQxlHn7VGZG8i1CqDK7xYsvAFx0=; b=bNTQVk1mDFYzGFds1f1H4whA21
	flc8uZYDpl5HmCwE1RIgevCgEyRCSSO5ipdpBMe2SXhDo/lT32EnbcIGNX84OyyRr/sQL0tRl68zJ
	z9tsNa7YsN/sGvM7cY/bcU1PHE4UzozNZ1jEHyQoiCJlXBqf59aJOKtZdVRlIArBfT7CPDwYutrkE
	EwnmInzzKxZUvv1G23Ya08HDIqYM4UHmltlKeYbvMRma8V3+ndiLazyBuOv8AE3wDmuMNGgtmD7Zy
	kRE5xWqn5o8zYUlCo72BRjoFvHZalzNhoC9rV/PZDBcdaWeEtfXgxKSBrkG/k4/gyrSsKAKDTHZbb
	4zdyTfIQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1788186218; h=from : subject :
 to : message-id : date;
 bh=L2qPTywjE2JdszhljQxlHn7VGZG8i1CqDK7xYsvAFx0=;
 b=hCSdCW22Bmqw0mvsIhdT9AxZzwPG56gZ7n9DbUYeLKZ7EzT2EZKrvi/G1m2UfQ4m7IzXo
 RMgiEN5o2xotjMogTpG1LThbe+3Stybx9UKuNqcuHzQODxVupa/xYLWplMp2SKxjE59tu1c
 OA1RAzY9LC/A4Ra7yr0+Ktjid/u6mo8wg3E6AbMLe6YESlJkX8qTGQCBtwyv4vQOuCUfA1L
 plqQIfR934FDd7OlfuZY4Uay5IZ22IkLJdJPM7ttLEnfY6ugrriVYOSVVRGsb+DV1MGFQUm
 MOfEQGuzKfWOqQqBf110MpxL1hm2npwlxLtlPOAwl/spHEUtOH9UoDRQ35TQ==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1x11HP-TRjxli-PB; Mon, 31 Aug 2026 12:38:27 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.99.4) (envelope-from <nicolas@fjasle.eu>)
 id 1x11HP-4o5NDgrsTBd-m6CO; Mon, 31 Aug 2026 12:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1788179906; bh=5wFA45ix2kFL0vq42scAgYM/zl1QiUa8lfttP/Wv2sI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+XSNepUAnjdxtRH3rFYWT6zEwG6kl5UCEgcfG/krRVzECIrfVlCRWxUjL3UFLs9M
 C7azZVHyQFMKMiI2KWiUjMuYXE7sv7P6oHVkK3K+YicPQzYeODwp4YMaFpNihqC3Ee
 KSgEyShVmun83uytnRfgQufgmF+LJACp6SmBD2Ws=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id BCBA84C4DE; Fri, 24 Jul 2026 21:55:13 +0200 (CEST)
Date: Fri, 24 Jul 2026 21:55:13 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: Add my name to the Kernel Statements
Message-ID: <amPDIZ4_aXEcPb71@fjasle.eu>
References: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
 <87cxwc8qa3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxwc8qa3.fsf@trenco.lwn.net>
X-Smtpcorp-Track: x3mZMLLaUWtU.8v8gPElrD5gl.xVVYuQMJXoN
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sd6z07ZLqi
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Fri, Jul 24, 2026 at 07:34:44AM -0600 Jonathan Corbet wrote:
> Nicolas Schier <nicolas@fjasle.eu> writes:
> 
> > Recently, I stumbled over the Kernel Driver Statement and the
> > Linux Kernel License Enforcement Statement and wondered why I
> > never before had seen them.  They express strong convictions,
> > which I do share and support, in clear words.  I gladly sign
> > both statements.
> >
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> > Nicolas Schier (2):
> >       Documentation: Add my name to the Kernel Driver Statement
> >       Documentation: Add my name to the Kernel Enforcement Statement
> >
> >  Documentation/process/kernel-driver-statement.rst      | 1 +
> >  Documentation/process/kernel-enforcement-statement.rst | 1 +
> >  2 files changed, 2 insertions(+)
> 
> These files have been static for the better part of a decade, and have
> made their point.  I'd really rather not start adding names to them
> again now...

fair point.  Nevertheless, thanks for maintaining the doc tree, and for such a
long time!

Kind regards,
Nicolas
