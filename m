Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E81FC118
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462487; cv=none; b=Ai/X26GnOCQ0GraVuWvyJ0LJXPuJl6d60uN27geXF74++BWemoXGqTb3coWhZA36Gej9Qg34Fo1myQNVrhnYVTXu2WiCqYrZb62z9B3Vc4+uAxzK1vtWQ7W97NATsI/Brw9P/93v7+0Jym3Rk6DiIVO1iVybUzPAk+G+vjT5/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462487; c=relaxed/simple;
	bh=nRz2yzSITsxRQzMh5EL9FOw5VJMeF8SAQBWYANCbNsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGtgM9LzbLFKkQ4raf5w+epp5P3tHR9s8xjTBEANg+LW5kAvtU/gRIgHlxaBGFBGUsKISHzSvMirNJW33YqEkk3QQ0rg1yKHY/CxCJ81zKurvmFXcToW7Aoq5V2tH09/ELlrAISS0v5OGe96MOmG2wSEPazNdf7UABnDVeNqwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-82-224.bstnma.fios.verizon.net [173.48.82.224])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 51DG137D005145
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 11:01:05 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id A7BEF15C000A; Thu, 13 Feb 2025 11:01:03 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: corbet@lwn.net, adilger.kernel@dilger.ca, jack@suse.com,
        Kemeng Shi <shikemeng@huaweicloud.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, dennis.lamerice@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ext4@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Minor cleanups to ext4 and jbd2
Date: Thu, 13 Feb 2025 11:00:55 -0500
Message-ID: <173946232426.399068.7156785933165072414.b4-ty@mit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218145414.1422946-1-shikemeng@huaweicloud.com>
References: <20241218145414.1422946-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Dec 2024 22:54:11 +0800, Kemeng Shi wrote:
> v1->v2:
> -Collect RVB from Yi
> -Properly remove t_private_list from document.
> 
> Patch 1 remove unused ext4 journal callback
> patch 2 remove transaction->t_private_list which is only used by ext4
> journal callback
> Patch 3 remove unneeded forward declaration of
> ext4_destroy_lazyinit_thread().
> 
> [...]

Applied, thanks!

[1/3] ext4: remove unused ext4 journal callback
      commit: fa1008e3df6220368b8ea3b004eca501ed546973
[2/3] jbd2: remove unused transaction->t_private_list
      commit: 06b9e91425b26b5e782f82a043a3f6c6354947c2
[3/3] ext4: remove unneeded forward declaration
      commit: 5e22ff3bc9358f994e65c870e2c4a8002ba81791

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
