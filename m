Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF81267F4A
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862259; cv=none; b=mwkBOsnuIeU3QeoGFU/3lA0cXLpea/iFx0t52jAEugqB+KHWaCraf14tgArb5CeuQvtEbGuSedgQIK4EwHiQYeZ/K8AO8s9/GSV2ssKYtw8IyEsrMBePW391Fsh+xiKNExQNgd/NZ+DaNw3YY9H0hn1jlUEDDK5f6nCLvyMoKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862259; c=relaxed/simple;
	bh=M5okF5B9MWiMgNs9aBUuLFkqgEnpbEJzIAQvkOzh0GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAOAesMJ1oOLUC9D/rLAjpMoPWbOulFayYTBxmhGl/NHKwSdmUCSBkX5vzUCS2NP68wPbyNkIlsitnhasDsA6JI8khpb07ppy54JlxRJoMqY/WnKo7qjxLYrolw6QoGbMDchkRvYsxhTRoUhBM2LcFY+6T01QqgJU2yerb+zOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-219.bstnma.fios.verizon.net [173.48.82.219])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 55PEatLG000596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:36:56 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 82F0F2E00D5; Wed, 25 Jun 2025 10:36:55 -0400 (EDT)
Date: Wed, 25 Jun 2025 10:36:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "hch@infradead.org" <hch@infradead.org>,
        "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
        "willy@infradead.org" <willy@infradead.org>,
        "brauner@kernel.org" <brauner@kernel.org>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
        "tursulin@ursulin.net" <tursulin@ursulin.net>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "chentao325@qq.com" <chentao325@qq.com>
Subject: Re: [PATCH v2 5/5] ext4: declare support for FOP_DONTCACHE
Message-ID: <20250625143655.GF28249@mit.edu>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-6-chentaotao@didiglobal.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624121149.2927-6-chentaotao@didiglobal.com>

On Tue, Jun 24, 2025 at 12:12:10PM +0000, 陈涛涛 Taotao Chen wrote:
> From: Taotao Chen <chentaotao@didiglobal.com>
> 
> Set the FOP_DONTCACHE flag in ext4_file_operations to indicate that
> ext4 supports IOCB_DONTCACHE handling in buffered write paths.
> 
> Part of a series refactoring address_space_operations write_begin and
> write_end callbacks to use struct kiocb for passing write context and
> flags.
> 
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>

I agree that it would be better to combine the ext4 patches.

Acked-by: Theodore Ts'o <tytso@mit.edu>
