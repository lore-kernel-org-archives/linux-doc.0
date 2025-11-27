Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8CD2405ED;
	Thu, 27 Nov 2025 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764220168; cv=none; b=Ji5ZusnzGupfNvbkOZFdrxRc2ADGyGxq7J9/n/0dAFpSRrSe/lxDXRaEv+IPJiDEKTiv4m2hqth+clxHClGstTSlLRiRRi4DgAJ3sXQCnBaxZFAjdAClJgRCXC3DbfOBnD/EaF9/bDJeylBRDHHUPdorQR0geBzwpAjkmBLdy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764220168; c=relaxed/simple;
	bh=+y6gZwPh+aN0Nr5lkvChJFrW62weJuazVjw2Bz9oDSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvTBnvBVnY+14xjEUc5U2B5sCsmzBeqlhe3tgsDBlTe6onHuucg6choDlUqbSsjetjVZhf05955f/Kv8dgWLR8fa/iKM0zKGNI6zwn6QPxAOU/SoGgvY4rhHt3r5OjtoP5DbTzulj8HlydjfbS2o19Mc4LqnWOzteVpI7D/3LOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikRBD77x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikRBD77x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899EEC4CEF8;
	Thu, 27 Nov 2025 05:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764220168;
	bh=+y6gZwPh+aN0Nr5lkvChJFrW62weJuazVjw2Bz9oDSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikRBD77xXG1Sj0ofy/deOpeSa/nyQBePGTeRrMR6l6t2zKxmEq+Ebe9Km9FmFEjyS
	 mkj/VdG0yYU9HMA/648NmycA7QW6hBeB9iXouLS4kO3LrXkQUmfyIZPgGowsMTtROg
	 wcwgTY0E4ivT0WGOSRDcmwL94rYFIU6XdrR6MzpI83ujaA3Ai4Ffy+ku95CLN2q727
	 5KgIbMA1qpSWvqzUJmFpN1zKxMiOkBon1ixDqHjgzIgjyDA5ihMTV20G/HbDkbImxH
	 JANfAOpzZORfWVTe7WEkNqC9UnL1LqizV1fXwW2+7QRtgMYBO3pcByTqCLzHlaOXd3
	 HSJ/q5TozOS7Q==
Date: Thu, 27 Nov 2025 07:09:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, corbet@lwn.net,
	nicolas.frattaroli@collabora.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	kees@kernel.org, davidgow@google.com, pmladek@suse.com,
	tamird@gmail.com, raemoar63@gmail.com, ebiggers@kernel.org,
	diego.daniel.professional@gmail.com, pratyush@kernel.org,
	jasonmiu@google.com, graf@amazon.com, dmatlack@google.com,
	rientjes@google.com
Subject: Re: [PATCH v1 0/3] list: add primitives for private list
 manipulations
Message-ID: <aSfc_h6U9GZo0KBG@kernel.org>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126185725.4164769-1-pasha.tatashin@soleen.com>

(added Dan Carpenter)

On Wed, Nov 26, 2025 at 01:57:22PM -0500, Pasha Tatashin wrote:
> Recently linux introduced the ability to mark structure members as
> __private and access them via ACCESS_PRIVATE(). This mechanism ensures
> that internal implementation details are only accessible by the owning
> subsystem, enforcing better encapsulation.
> 
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
> 
> Pasha Tatashin (3):
>   list: add primitives for private list manipulations
>   list: add kunit test for private list primitives
>   liveupdate: luo_file: Use private list
> 
>  Documentation/core-api/list.rst  |   9 ++
>  include/linux/list_private.h     | 256 +++++++++++++++++++++++++++++++
>  kernel/liveupdate/luo_file.c     |   7 +-
>  kernel/liveupdate/luo_internal.h |   7 -
>  lib/Kconfig.debug                |  14 ++
>  lib/tests/Makefile               |   1 +
>  lib/tests/list-private-test.c    |  76 +++++++++
>  7 files changed, 360 insertions(+), 10 deletions(-)
>  create mode 100644 include/linux/list_private.h
>  create mode 100644 lib/tests/list-private-test.c
> 
> 
> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
> -- 
> 2.52.0.487.g5c8c507ade-goog
> 

-- 
Sincerely yours,
Mike.
