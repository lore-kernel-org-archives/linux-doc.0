Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA7231C9B;
	Fri,  4 Oct 2024 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728083913; cv=none; b=Zlg+KINkErLqJR7AdCv+1G3WAT2TPx92amdBX54sfzg2g9Hjpc+DuBeMM4TGgyBCmP5TiexWKYbb3Oa4JgyBCAoWJwF5JwB68N6w82KZtKYd4TVhcBUKU/uOttdiPy2l2emZHwLoBbVLwPul7w+Sh5l8ogUxi7CgynRCfXEUqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728083913; c=relaxed/simple;
	bh=u1LcmHB+rnPzXwurBK4RqTh1rbtl+0DBBWeUPU5YOBg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxwByzkAOpiw0/C4TU/pnHsSPw0Bf8LuXVLTMeKkczjOCjtWJd7qTULTGgmOkuxW4APf0ffnvizE+6ywKjRZ3Yk4qRs8gXvroG5+7QrsA5XeA54yIaOk++8Z6pVPxTa9Mto79gjklvm7bjj/5t+sAk+FWgPUl/mO0LCgI6AzUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A36UG8rK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A36UG8rK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54681C4CEC6;
	Fri,  4 Oct 2024 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728083913;
	bh=u1LcmHB+rnPzXwurBK4RqTh1rbtl+0DBBWeUPU5YOBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A36UG8rK/jg5nTtK3g8Sk9/jcrRMVoW8Dm49AQ+Ebb9WKtKG0/O9UF99yYc9O/NbN
	 pjE3o4GSbI+b91dDrFsJT29MjCOwQY0GRi3Blr8uAMHBTmpJnOy6SifQFVA5dkNSVr
	 j3WSuvBaWwdFR9DJVl7Em3NSAD8YRylaLkXy9eSyh3r5I2Ej+hNAJ8NRGOX742dEWV
	 3uURBmht3jq+yXXQbNLtHVDNX5cCYfELW8ulvnnC+Z29o1VRq3oiLhaDjB3kspvGIb
	 63Obbhj64uxLuuqGw0khZqL/S49FLQoJ7vOrhhnppW1qNd27UJdTTblcH+SL2nUzmt
	 SpfxLarWo0aNQ==
Date: Fri, 4 Oct 2024 16:18:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 donald.hunter@redhat.com
Subject: Re: [PATCH net-next v1] doc: net: Fix .rst rendering of
 net_cachelines pages
Message-ID: <20241004161832.056fa9d0@kernel.org>
In-Reply-To: <20241003205248.61445-1-donald.hunter@gmail.com>
References: <20241003205248.61445-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Oct 2024 21:52:48 +0100 Donald Hunter wrote:
> The doc pages under /networking/net_cachelines are unreadable because
> they lack .rst formatting for the tabular text.
> 
> Add simple table markup and tidy up the table contents:
> 
> - remove dashes that represent empty cells because they render
>   as bullets and are not needed
> - replace 'struct_*' with 'struct *' in the first column so that
>   sphinx can render links for any structs that appear in the docs

Thanks for doing this! Looks like the files have diverged before we got
to applying it, could you rebase?

Applying: doc: net: Fix .rst rendering of net_cachelines pages
error: patch failed: Documentation/networking/net_cachelines/net_device.rst:5
error: Documentation/networking/net_cachelines/net_device.rst: patch does not apply
Patch failed at 0001 doc: net: Fix .rst rendering of net_cachelines pages
-- 
pw-bot: cr
