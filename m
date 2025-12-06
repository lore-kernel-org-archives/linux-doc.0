Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF982D8DB9;
	Sat,  6 Dec 2025 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765057176; cv=none; b=ilDCm31YjW0qNNoVqOyWURHvtfZyge7qsJXjNBaZSSxAiZzxvU12z05/guZa/vBZfEzFHzvm8sY9vBPfYnWgsHiv0VHOB2+HlUQqFtHMgUEn49zNnPvGFJDRW/93axqlNug4frGzwN2CiVKQ6GWHWCqFwfcmlCckH1aFKHpdVQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765057176; c=relaxed/simple;
	bh=nsdLHlN3zvaymZd5CT+HVzJpxktnIfXrF5AWaOIJlnw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aVzj/oSttf80bpWTs7+cb88LLDYVmjY05GS9CP8fCxV4uq/MnH8H01txZTlfQcBsbdaKNyN/Z4rBfX7pD4U5aokCY8SXCD2pWTmHRCLZZ1MRVmqKdTDl709dE71kPs42br0jfXBOq+FsKidU/UWIEtS1W+ES9H54jETAw8vAdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gLMJMvsu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gLMJMvsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDB5C4CEF5;
	Sat,  6 Dec 2025 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765057175;
	bh=nsdLHlN3zvaymZd5CT+HVzJpxktnIfXrF5AWaOIJlnw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gLMJMvsuBVEz+YEoJwFwCaE7x2LhQgVEVEA+vwB0GaeN1Dnon5huO1u0/tIU+qHvL
	 t25TPALPVSHMtdbaHM4VHtyYteEPaF3OmxddRpkPbyskvq9n6lpI0COmz+SvKJOCba
	 /YB/njuRjxPwmkS6VrWfQhM6DkIDUv/UB/2UTDJw=
Date: Sat, 6 Dec 2025 13:39:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 davidgow@google.com, pmladek@suse.com, tamird@gmail.com,
 raemoar63@gmail.com, ebiggers@kernel.org,
 diego.daniel.professional@gmail.com, rppt@kernel.org, pratyush@kernel.org,
 jasonmiu@google.com, graf@amazon.com, dmatlack@google.com,
 rientjes@google.com
Subject: Re: [PATCH v1 0/3] list: add primitives for private list
 manipulations
Message-Id: <20251206133934.bdbf1db342c52070ed1d5689@linux-foundation.org>
In-Reply-To: <CA+CK2bDyd9jkuD+aBEaSTqw_mAXyvV9b8pa-z6eDvEByQ4oTiw@mail.gmail.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
	<20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org>
	<CA+CK2bCUBMgnepMzO21+SH6rY7bb2OgRqxkLkUr33UsrPoe_2A@mail.gmail.com>
	<CA+CK2bDyd9jkuD+aBEaSTqw_mAXyvV9b8pa-z6eDvEByQ4oTiw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 5 Dec 2025 16:52:32 -0800 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> > > > Adoption: Updates the liveupdate subsystem to use the new generic API,
> > > > replacing its local luo_list_for_each_private implementation.
> > >
> > > Fair enough.  Let's push this into the next -rc cycle, OK?
> >
> 
> Hi Andrew,
> 
> Could you please take this into nonmm-unstable branch, I want to send
> a new version of LUO-FLB, and would like change it to use this API as
> well.

We're in the middle of the merge window and this is next-rc-cycle
material.  mm-nonmm-unstable is included in linux-next and linux-next
rules request that we not add new material to -next until the merge
window has ended.

So please resend this material after -rc1 is released, thanks.
