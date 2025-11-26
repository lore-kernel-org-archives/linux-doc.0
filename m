Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF31CD15;
	Wed, 26 Nov 2025 19:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184765; cv=none; b=H1GlZIRNYUYBYL1J0bbewrvWXAJ19SzRLFv0Z45pt2/MZ9Adpi59jiPQJvG2NZ6YamubWacyJCNSUrhK4d1yF7SeU7n9lwjdsn9o1skUq+zGutaTee6NeVRgHwLt6NNI7XgUL82qn4f5X8EX7Bf3DJq8Rl0FpGE6Lsmgk7qOUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184765; c=relaxed/simple;
	bh=tIYXXfeomnFHMuQAlEQu+U6igurxLIyoyJl3h/bgul0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u1L1XThBfEHMPBF6+WA232dcLXM0YY6WJ8mpzCkNSR3fbECH6DvarkkfO80t00zYa3f0Ox0GRSaWle44RSXbAwBXS/1BQzXIzL+yUDp557yPCpQE7uRIlkA8LRT7teZJ73DaxjDY4S2VM0551qUmoRRmykxknPPw87GuQCoWaqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SUVODJJ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SUVODJJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2B3C4CEF7;
	Wed, 26 Nov 2025 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764184765;
	bh=tIYXXfeomnFHMuQAlEQu+U6igurxLIyoyJl3h/bgul0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SUVODJJ1KTX6oJMInLLhI0jKArXutobIXBYpmZN5GCZsuJCE0ejVN6JlsJZj2y8Uy
	 dw3EvL8abXqQq1uK/AdeqAtNVJe76eF1yi0t9EV0wQDwDPI0wmi4oifs2aqtPJKGvq
	 r+XIHF7BnlfqqqH6UhoLZpRcZpA9S1urFmRqWn+U=
Date: Wed, 26 Nov 2025 11:19:24 -0800
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
Message-Id: <20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org>
In-Reply-To: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Nov 2025 13:57:22 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> Recently

Well, 2015, in ad315455d396, it seems.

> linux introduced the ability to mark structure members as
> __private and access them via ACCESS_PRIVATE(). This mechanism ensures
> that internal implementation details are only accessible by the owning
> subsystem, enforcing better encapsulation.

Didn't know about this.  It's a thing which requires running sparse
(which is fine, people run sparse).  It isn't used much at all.

> However, struct list_head is frequently used as an internal linkage
> mechanism within these private sections. The standard macros in
> <linux/list.h> (such as list_entry and list_for_each_entry) do not
> support ACCESS_PRIVATE() natively. Consequently, subsystems using
> private lists are forced to implement ad-hoc workarounds, verbose
> casting, or local iterator macros to avoid compiler warnings and access
> violations.
> 
> This series introduces <linux/list_private.h>, which provides a set of
> primitives identical in function to those in <linux/list.h>, but
> designed specifically for cases where the embedded struct list_head is a
> private member.
> 
> The series is structured as follows:
> Core Implementation: Adds the list_private.h header with support for
> entry retrieval and iteration (forward, reverse, safe, etc.).
> 
> Testing: Adds a KUnit test suite to verify that the macros compile
> correctly and handle pointer offsets/qualifiers as expected.
> 
> Adoption: Updates the liveupdate subsystem to use the new generic API,
> replacing its local luo_list_for_each_private implementation.

Fair enough.  Let's push this into the next -rc cycle, OK?
