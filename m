Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066AE2673A5;
	Wed, 17 Dec 2025 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766011680; cv=none; b=PuLbMbvnVbRv2SIzCdqL1sFyNOn1B3gGrXHB3R8BzX4SL6HF9P1C5ZpozRkN4Ia+nnZbztTzdwWyuBtIm8f+vDct0tImuMOnQGiOEnhAVbpUmMu9/XTxKJbZiM4SBZzXu2LuZR53gVwBgRZMe03SYqLeg6sB3+ptmrtH06RVf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766011680; c=relaxed/simple;
	bh=ARXU1+z9r/Yp1jXWKpUnJmkkcbuy8GgWPXa3pKpZR1g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JRAWNIWi0n8dUKULG8idPvmFzVrvpVM7CkVxEtnU3/NbRlKYSt5KO50fc1p7QG1pQfhcnIPHEWWW9qOxC+CNHzSNpQnC1AYczz7M8rx2UyClv0AjqleD0GdwrrqJr5QsnrbUOvSfDYjkB3xlFGohYZeWgwyW/+UgM9tRtrsA9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zoT79XcL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zoT79XcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1955C4CEF5;
	Wed, 17 Dec 2025 22:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766011679;
	bh=ARXU1+z9r/Yp1jXWKpUnJmkkcbuy8GgWPXa3pKpZR1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zoT79XcLpZyNwkEldkiBUoVCWXt/1jkqTV9TsGYXIDTIYSM7UWK5xwHaL3L36cxAX
	 MWqun1eMQh1jG/aA6hfNhYREqMHOt0Xd7O8pPk1sZVnvaZv0Mlw3eYncYi9tpE3QIK
	 jWKZoqPwybjVfhkOD2/PEoufs2NO25hBJVQeIkao=
Date: Wed, 17 Dec 2025 14:47:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 davidgow@google.com, pmladek@suse.com, tamird@gmail.com,
 raemoar63@gmail.com, ebiggers@kernel.org,
 diego.daniel.professional@gmail.com, rppt@kernel.org, pratyush@kernel.org,
 jasonmiu@google.com, graf@amazon.com, dmatlack@google.com,
 rientjes@google.com
Subject: Re: [PATCH v1 3/3] liveupdate: luo_file: Use private list
Message-Id: <20251217144758.4cb7fc20f6fe32a36e8e52ea@linux-foundation.org>
In-Reply-To: <20251126185725.4164769-4-pasha.tatashin@soleen.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
	<20251126185725.4164769-4-pasha.tatashin@soleen.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Nov 2025 13:57:25 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> Switch LUO to use the private list iterators.

Seems kernel/liveupdate/luo_flb.c now needs conversion.  Oh well, I'll
await v2.
