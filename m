Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EDA28D847
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432459; cv=none; b=RCbN02JcvVofrFy/X2keK8dZRHw/MPwX1HrUVRHR5ngl6SHPQBk8a4M2uUtxZfWV/bAEsxWP0PT0plrdRThqbsDAkB6Ge6VHuXtEQVDzngWanI32rfLjfF6IJ88xsBL8/c5cp5G4efXj9m5TwxFX/YUz2Mz3/rQaRIaAJM09kDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432459; c=relaxed/simple;
	bh=3cwv0921IscvB/NrWSs0v/7SM8HODWnllMIfji9Jqrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuNC2RlOdZPFojPoTdk14j4QN/wvwWnx6UDUUvVZDCuRWuEx5JAeqdgRHYnGnXPPNhawqaDrymyWQCcq2JXWl7csXeEy/5JMhC8VWqG6RAwo7c5sd8WOeHj5atO54Cice5PdW28dG5RefjEz6FREpDM7O9uUJJdiU/yjYZajNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-148.bstnma.fios.verizon.net [173.48.82.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53NIKdBm005121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 14:20:40 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 5587A2E00EC; Wed, 23 Apr 2025 14:20:39 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, Tom Vierjahn <tom.vierjahn@acm.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, dirk.gouders@w-hs.de,
        linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: ext4: Add fields to ext4_super_block documentation
Date: Wed, 23 Apr 2025 14:20:34 -0400
Message-ID: <174543076505.1215499.16527346379212459412.b4-ty@mit.edu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324221004.5268-1-tom.vierjahn@acm.org>
References: <20250324221004.5268-1-tom.vierjahn@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 23:09:30 +0100, Tom Vierjahn wrote:
> Documentation and implementation of the ext4 super block have
> slightly diverged: Padding has been removed in order to make room for
> new fields that are still missing in the documentation.
> 
> Add the new fields s_encryption_level, s_first_error_errorcode,
> s_last_error_errorcode to the documentation of the ext4 super block.
> 
> [...]

Applied, thanks!

[1/1] Documentation: ext4: Add fields to ext4_super_block documentation
      commit: ce7e8a65aa1b7e8a6833403b314fa8f2cf133119

(Apologies for sending this late; I've been dealing with a family
medical emergency.  In any case, the patch landed in v6.16-rc2.)

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
