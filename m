Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A729BDBD
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054391; cv=none; b=WfR1D3MkAtXrUO0Kp2mya+BNzIiuHTO0Yv1KNXCKloa6QappbvL5EXCzb5dWoQcziV0ZJ4v8QObhdsJR8DCKFjuN6NUP8814bbHnZzdAPv+lTT3HTjQMK1sd6JnPEXN2PCANbN/rLnMmgHeQZE3+JVZ+f+BMj4/Wx2JYttnvUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054391; c=relaxed/simple;
	bh=gL8uCUJiJhHkiRNkyf53CfWI8RBSbR1NS4lJMuLRlY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCfC95/t7CWMVtsn8e0E5HFUkNz7x86EWKjvTqxAlD/fW7DN+XFz0LBCEPZWVif/EWuV2ouZcHLhWNMNlarDq7KzmpAoTHQw2fEsEnZI0wvidaWn5hAxNhN4cl0/PF6z/VfQ4YnxdwacvjictPrcS7+duOmku/F7iOcUE1Kl4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FhaemJHj; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FhaemJHj"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-894674a4c4aso85097486d6.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 09:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1770054388; x=1770659188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1wm0NexTqa+iJZbv1CobgpMNsP/JgzOw/JXCIX3sf8=;
        b=FhaemJHj8nP4Xz0vsAeScEVMy7SHVg4mSlhJ59pasSiPnQ5mddAFKvsyV+d2mDoBZA
         eGJbg4Z9pOFim4xE85y0R5Di6iXbDAMFGcf+R2zIIby0Ygf1Owvs8u2+/HW7ILjsxF9g
         G1NeQO4b1NF9FmTXTX9W5w6Dlm7u266be99eQYKILV+t//GFuw2QT1fjyrrItMU44720
         8+SVPhMn522jFPRb8ew86WTIa6NUkmZf1cThnHp78YLtdVMoAsnGnjxrQWugfuPtgMLJ
         79IClZ+ie0w4kg5umbGLa13+m/pBRbCg+muFlFv3iRy9jT1PpVVy83NsQu+xd8IrBgzr
         4IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054388; x=1770659188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1wm0NexTqa+iJZbv1CobgpMNsP/JgzOw/JXCIX3sf8=;
        b=iQNamkTJULbWXT0/i0IzJaN3FZdL0IfvnrogZu3fGzDFMAfOz+XmoOz0Dz4Qx8A1xM
         QfT7dLQkTorD7Zvj1s7Y4jT0t/iuYkRiXaasGx4RCnVTfjvslImEUtrSLI+v7V8sZHgk
         DpONfSFqvk8M2bBSfHGSwWFx7OYS2c4ldw3vKfrIT4j+gP2XQifPgj4wVNdO9XISvOA+
         bm/vPv7lUO49dOdWNP3J/m1T/m0WOjIyJ88XmHBYLQ86Dgk3ABt/jussD9J+SjK6rWrM
         r/7bvDyaJpNmVAJNGyTAAQGTNzSzb4uTWs5pRsr6LnfrD+waQ/OxKcqiSbVmjdlNmk8c
         VRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWN2sd1HnMkxt/SkTS3/mzoBADwG+CNFVITGa0TTnYyipwrUDQLqYxkQcDv0CdtrIa5I5OY8zTga0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywffc5rlngmEpoY1aA9eQabZgKpgQn4zwTn9hd4lUGe1B8jt09X
	+ijQP0hbepeZp+E6jKK9gIPYuUYvNfeesb5kxjB5YdnRDpFCB+DlQDxG7cXZlVYWR8M=
X-Gm-Gg: AZuq6aJ72PHde7RuIHUjd0gzhe2M8M3z4mlxKQEUM/4Wj3Z0pa5BT61DibZpyFga6no
	J22Qsxn03AAYLLw0gVJrlKBqZaq+3wBHR899GNwatAktD+b68ZNyD/SfoaRVb6AqisRkbGiQYAj
	MSrGvTqvS3at/0xK3/XTF5noXAdEZDF4lUbA97wANLaf7/pblXAdu2l4GRpwjBorTpsy4HvBZNP
	iby/CI0dwDocwmcdLD1QPSDcDESEqShiNLIINe6AKjjNClJbWOXzAwNLf/6QuPDxvGq3EdqOX2D
	gJLdMIkQkPGfJGK5odidUb62EoXYC32rew1En1/rwdotwh87lMd3hmvXYyOtNbUaL/I7Cy4xNn7
	ifqCJxpfS7t9xJ+U0v/EOdUoTA1TosSsEh8sN9AvOtQaBBzIaydFO0ZTXI/+b7QJW/v04DqL1BN
	9KHqxTl8OatJ1ED3Z19rtp4aI/9iaxSxmayhQAgdoPE4Smnyb376TeQJHPZtoEC/sgfKSlGnxoU
	TMWsLdE
X-Received: by 2002:a05:6214:c8f:b0:888:4930:82aa with SMTP id 6a1803df08f44-894ea166512mr179211126d6.70.1770054387847;
        Mon, 02 Feb 2026 09:46:27 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d47e13sm1267680485a.45.2026.02.02.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:46:27 -0800 (PST)
Date: Mon, 2 Feb 2026 12:46:25 -0500
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-mm@kvack.org, linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, willy@infradead.org, jack@suse.cz,
	terry.bowman@amd.com, john@jagalactic.com,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: Re: [PATCH 1/9] mm/memory_hotplug: pass online_type to
 online_memory_block() via arg
Message-ID: <aYDi8bhxFnvMWl11@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
 <20260129210442.3951412-2-gourry@gourry.net>
 <20260202171029.00005e80@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202171029.00005e80@huawei.com>

On Mon, Feb 02, 2026 at 05:10:29PM +0000, Jonathan Cameron wrote:
> On Thu, 29 Jan 2026 16:04:34 -0500
> Gregory Price <gourry@gourry.net> wrote:
> 
> > Modify online_memory_block() to accept the online type through its arg
> > parameter rather than calling mhp_get_default_online_type() internally.
> > This prepares for allowing callers to specify explicit online types.
> > 
> > Update the caller in add_memory_resource() to pass the default online
> > type via a local variable.
> > 
> > No functional change.
> > 
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> 
> Trivial comment inline. I don't really care either way.
> Pushing the policy up to the caller and ensuring it's explicitly constant
> for all the memory blocks (as opposed to relying on locks) seems sensible to me
> even without anything else.
> 
> >  
> >  	/* online pages if requested */
> > -	if (mhp_get_default_online_type() != MMOP_OFFLINE)
> > -		walk_memory_blocks(start, size, NULL, online_memory_block);
> > +	if (mhp_get_default_online_type() != MMOP_OFFLINE) {
> > +		int online_type = mhp_get_default_online_type();
> 
> Maybe move the local variable outside the loop to avoid the double call.
> 

ack.  will update for next version w/ Ben's notes and the build fix.

Thanks!
~Gregory
