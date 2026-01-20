Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38130F813;
	Tue, 20 Jan 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926756; cv=none; b=l8scWvHO1NiaAe52bZpT/AQKXf63tZk/67S39lZMSROrnUTVDXWI+HePywd29vxcK7ghPC7wC2RH2MvOyfjYcAGCWVLGrCRhZM5tE4sxEueNER1O6V/GdEhNOSNCzLtDmrNwGrZuVpNAmxZbMlTKC7D/OZDMF7143zKS3rFkkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926756; c=relaxed/simple;
	bh=BkuoYdiOjEdaSxlt18GMMC+iBXjttPiaqaXPWhOTAOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tMEJqTNyoDnYSd0wkG4bNCPLggz2cYaYvkUPIJm3kPVRv+eGVRWOiWb06YN2OtQtYZSHJObdhbX1aWBYDx+e5qWha7QsfDDwdV0MINvndELeA7DxPMw1991igpoEK0kTQ8B2U5yv0xfR86qmnY99ZVFH1c0DqNJGUsmhBvtfZ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M15qmp5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M15qmp5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF72C16AAE;
	Tue, 20 Jan 2026 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926756;
	bh=BkuoYdiOjEdaSxlt18GMMC+iBXjttPiaqaXPWhOTAOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M15qmp5zcgPGZax3J+ZpO3YDXmk7U0i6dtAhX2uoznBFQL6z5+MRRhW9PsqcRm1qP
	 oL33nkA/ilfO744wGvuCqNvPRWbuskm3T9vocCqHZoMXP3wuH19kiHhQJ7AX9YYL5g
	 ANehmWMB5hXgbPWRvRn3jXjgOHfvCWhlFiHmRerz+D52DzvXq6rgdViR5uplteyW3z
	 Q1Nm/DQLL/ois8KKJ2sqoNfliwN0DFQMdwRV0+29Ok0CNq6xiSr73DLWWTl3wvxeku
	 KrBOWFA4RZ3lBbyc2JG+BJ1aF2eB57Uyw2VkRpycAgiOSy2yDKJwTbW0bQFVriPBdu
	 pvNuc20XRJrHQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 0/6] kho: ABI headers and Documentation updates
In-Reply-To: <20260105165839.285270-1-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:33 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:32:32 +0000
Message-ID: <2vxzms28ckin.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Hi,
>
> LUO started adding KHO ABI headers to include/linux/kho/abi, but the
> core parts of KHO and memblock are still using the old way for
> descriptions on their ABIs.
>
> Let's consolidate all things KHO in include/linux/kho/abi.
>
> And while on that, make some documentation updates to have more coherent
> KHO docs.

Thanks for working on this! It is nice to have the ABI consolidated and
cleaned.

[...]

-- 
Regards,
Pratyush Yadav
