Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514473093B5;
	Tue, 28 Jul 2026 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237468; cv=none; b=ddLSjPe+XbhFQdarLwMC1MADq+wLhzttQH/H9bKWbISYbY2e7yQiCpS50P8XMDwGBl0Q0W1rORAet+Lq7WXqJefiTLniSIDEIO41HBs8KF0Go+mCK3DhciMizDT+dix42jT+0OkX0Xro1BSUnVab2C1pY2Ij7eCWb8eG2tke3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237468; c=relaxed/simple;
	bh=c3Jzxz8cTBKJ4oQjMR0dsChUMmbd1kyxivRCL+os77E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTsX7/ydbEYF9ifAC3D0NLQubP/5S/YutLUvDnsCc6yNe10wUNPHDqIBYPzyPbohwPH1CgBEngVTdT1Av8nzgXUjSCAmdpbX3U/TCW97QQCWPq75aadxTlmmjJhVYtfAlfnqhEKuLG4/kwsHvDaIAOe8t32yMlJP8PSiGgESzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEaWLwMn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEaWLwMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7F41F000E9;
	Tue, 28 Jul 2026 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237466;
	bh=c3Jzxz8cTBKJ4oQjMR0dsChUMmbd1kyxivRCL+os77E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEaWLwMn/SH7yWGkv9FDUMXJ/oT4Y5DSiJs8nA9k/fLDZCybRc6HHMqUW1swC5ZXd
	 IW0gxe/iL0DDhZ3B4O5GdzwYhCpRIOI18lPEfvKohj2qUfF80pgk9roQGRs9Qv/u1r
	 MrCKe+2KEGdamnHre/AfpqksnW/y/MRXJrlyiRUG/+ncbSIYEdEp7cRnneFZBeaf8q
	 dHJtjrj8AVq1N6chHHvmcc8F13IHbG+6A1Zhhkm2yQP3W2c7ueSgMdxttY7+61pjVr
	 YWpnU0Uj93DTKaTuNL4C44n5cTExFOdgEGdjVsrFut6WdY3hZuK0Jjd32XASGU4v9I
	 qcMWJCTyB4+HQ==
Date: Tue, 28 Jul 2026 12:17:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: pratmal@google.com
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	sj@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	anshuman.khandual@arm.com, gthelen@google.com, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
Message-ID: <amiPTPKfTOEpgetH@lucifer>
References: <20260727230545.262579-1-pratmal@google.com>
 <amiN82J8p5z9l_Rm@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amiN82J8p5z9l_Rm@lucifer>

(Also this patch should require a tag from Vlasta as it comes under the page
allocator.)

Cheers, Lorenzo
