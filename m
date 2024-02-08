Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2B1E89A;
	Thu,  8 Feb 2024 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707402995; cv=none; b=APF8RqLsHQ3RhlHML3pQdOtkshDd0q2jnFlAhBfy92C/T0s2p+NAt01DozUBBJWvmD89cyYXXEMua7kg6oGCNqkZaajyHByMZA5sgAmRDCXLE3bBiiQIzSH9oRSTtOu941zECe8P4sAxdfaqVEWS8v/NLpYWKqAX+s8Kuh8fHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707402995; c=relaxed/simple;
	bh=ZOFEzPp2Vx6z00VEJaxYp2bG8Q5CLe9q20m1Ox5HXiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbYXuyvAdqYx+IxjgIzFHM68SF37fn1BCmc9raeOg2uHWe4J7MMsR5eMvLmqTnK6mpURSOZdmTdK7UmVWaOYcvTgo2Tlr9vzme2Q2efNGqMIchojs/xynDlT6kHwcZqjcn0EjfJj06UYM8HbocCdB993vfb80gC+w7a7kk01gAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F89dvR5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F89dvR5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCDDC433F1;
	Thu,  8 Feb 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707402995;
	bh=ZOFEzPp2Vx6z00VEJaxYp2bG8Q5CLe9q20m1Ox5HXiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F89dvR5eDyRjrjnyH1oPcLBj2UIiBAF+zyiHntNNESWE8sv9Z617+3oyuqtNRRLfP
	 /weKX0OWl8j9sfCLt6Gva5wWWqG8yvCsMIr8mq7ebx0xuUuTw1ZZeKEhzmuGCKH4ff
	 gdEFSH2nfmntnpvIfSE7xQB/129H/jNhUbv5NrZ5PqYQaxZ285TqN/241Ci5nGiRF/
	 m/3CE7daYYaydGAYYtAhGVpBbBpjrsbWd/eAzjrs+6SO2qz91P5rwMSAPViK5bretD
	 hmR1vGiwr6OSQA67myue+axCDrs1APw9pRT6Hwh10MgzEOT7NACuuT8by0+qTJGFsn
	 Om1Ug395mOgUw==
Date: Thu, 8 Feb 2024 14:36:31 +0000
From: Simon Horman <horms@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net] devlink: Fix command annotation documentation
Message-ID: <20240208143631.GJ1435458@kernel.org>
References: <20240206161717.466653-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206161717.466653-1-parav@nvidia.com>

On Tue, Feb 06, 2024 at 06:17:17PM +0200, Parav Pandit wrote:
> Command example string is not read as command.
> Fix command annotation.
> 
> Fixes: a8ce7b26a51e ("devlink: Expose port function commands to control migratable")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Reviewed-by: Simon Horman <horms@kernel.org>

