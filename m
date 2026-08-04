Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BDD413D62;
	Tue,  4 Aug 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871003; cv=none; b=EWC+ed512Wdx8riAeBoEAk2RkfrAmMMujDTTT7cgSD0tfQUmrvNoe9raMH7X1CDuHB3URerhhQch8JAu+wkyZ3zxXrHXPTa+3X+MVI8pffC6JN+2z2We64eE3Vw5rbALrXZG4SxAPC2pKtb2SwmJVup7gKgXD9yogmUzQ71tJBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871003; c=relaxed/simple;
	bh=FgRjbJKAl4V8RzAJaBLmL/IJbXZH+Y2KMjwzUT+fk2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2Yb1pU33QeauZp9VhDV7d1fZ9XgzZTU67CdTCO+SWYg06tSY9f0jbbeOu3AWmdWMqj+YpQIyQNg6igUQd5O/nC5TY+Stquc5im0X9B4NEJq2EoXx87ZneHNhWtv+lEl/PaxaSs89exHQtUVa1y9ybt1ZftV+AuUOl4OM/6x7B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HC0TmVZG; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HC0TmVZG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9820B40E00C4;
	Tue,  4 Aug 2026 19:16:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6pONP4-PXWB4; Tue,  4 Aug 2026 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785870989; bh=D2SEtCWEZypo2mez6jWRkPPS+Cpggm0zA6yMdlA/rZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HC0TmVZG1sFJUgIssAxvveCPRF+rvNB2gqyzvYSEo2HbNnzE4ij5D5O9n+6moEYPf
	 ydWPLYGlX4qalWsNEyjuJhNJPBItkmo+8tNJCteseBu7WYAAR+YnPPXtICaPWKONGK
	 XCJWkGRLyD1V5YuW8ZL5Ode8DyCyWmnuG2gXtOyI97kQR4/gfy6Gl74hITwkbc4o7G
	 khZ/0+xWp5QafAXCZBpP3y9eW+5IwkgcPsLbr2nItwT9o1NNJiqACZ/bt1w9Ory0j9
	 PoXe5XFfLiPGAjG6lOxZR8QWBVWUqRS1i7Zzf4pQ5mQWJoyahqqNjx9f7QWRd0U6qY
	 OzL+4whhG4xqv66WQ8C5NKh+1xdHr/2e2wxvX2bKQqX1qHJPg7Zi7UNt9nYZIXaDVs
	 ZQMwnue2GupeLsc3X0Sb/8cYi9504ZvNkr4+JUBYl1PAVorViXo5Mkssp5YdAT+paW
	 Ty4Xa1G+Zu0DqzB38s/gvpI/S2wG2rpkl9yZKDaT4bgAMl1azkoeVUQ3/zI2VPdYBZ
	 HXSOAkV8uQmes2aGkR/SNp3X4D5SyOrzWM3wqHPoYwa90YOFCjn1R7R3sFUzeRFv0L
	 rKSNhlZvoSpmVohBvrgi5+uIJk9p6PYLT/b9NTTV+fnZTdmTx+Sm0m3nNvlRZ+8CxG
	 xQTVFlkD+5hi5qJUHEDuqaNc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E860640E014C;
	Tue,  4 Aug 2026 19:16:11 +0000 (UTC)
Date: Tue, 4 Aug 2026 12:16:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	"Moger, Babu" <bmoger@amd.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
References: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>

On Sat, Aug 01, 2026 at 04:47:01PM -0700, Reinette Chatre wrote:
> ...
> On Intel the RMIDs are always counting. Please keep in mind that these RMID do not
> actually return raw counts that are verbatim passed on to user space but instead
> the returned value is "upscaled" using a hardware provided scaling factor to obtain the
> value that is returned to user space. This is done on AMD (with and without ABMC)
> and Intel.

So, long story short - and I appreciate the explaining - we should switch
AMD's default behavior back to RMID + 64 counters - exactly like it is on
Intel - and the ABMC thing will be explicitly selectable by the user.

This way there are no surprises when running any tools on either vendor and if
one wants something special, one selects it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
