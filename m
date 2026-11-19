Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099670;
	b=k/WhrlbYAOJt177getUZWIFyWaJN7EgitpOyv1rKR4VBmipCCgJxjguizMT7DXiI7fWt
	 LSNuFZbMrb3XSFce8goNaml2Wmyka3qni6/UYID/yg6YPW6o0r9o19qyeAU+OwnFbgmrC
	 uqUsIYbOajQZRMdljwAPTRz9zPkDA71USh7HoZ0jUh6QmBgWSURFw5/TNQnCbuhqXf7X2
	 UNCb1dMcDnAWoBkTK2ozvjlDKZHIhkHgiG/0tHUe/hvkMLLGbwKZeq65iEe/SKLrk+Cg/
	 bDlTwNLO4zJKiUATTtGc6YGBs4zbCKea1RoUSjg1z9PHLwKYtneQDtR6AW14wSSnjWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gDlTKv19fJF29uMC88LHc/i+xAKGiefALzGPZX9cwsE=;
	b=fH/IpFxOgOBgK4CefWJdrcaH/2bnBzNEggC+6RGzugUAlKQds4ygEq4N6ECEL/nrT2UQ
	 02a+jawii6kSqwaSBJasuJnHea4qkNvIyvCRunbagPhpLtfXEhc3+JAjSMXK3fw3d71P6
	 LLxZnpHHcpSblXMQn1VkQteL+xFvHtBFgJpZAf6RIY8fWve0duMlxqOmL7I5NW3N5O2Bw
	 aV1sFT69yCsFgFrxAkC/FlXfHiLKze2nV3wS4WVpW0eNlpxSXa2yT+smuvfauPariMLVQ
	 YrfMCcEQp9eO7hVmPrlUuuHHkUaAZ6edQZvFHXyIFIeuK1+4CH76cRvX2kCihbe9pzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=NhU+Xsbg;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBF360A262C
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBF360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=NhU+Xsbg
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElcWc017959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099660; bh=gDlTKv19fJF29uMC88LHc/i+xAKGiefALzGPZX9cwsE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NhU+XsbgmOEPkAUb9TUYK7snHGC8e8E//BrcTbFoz63Gsw3LHCyn+Vy1RVanm/N2k
	 +VYGB3CCXzVmgslr5FCzf7DooD2xvTqLSryGslAYrCaOufaxoA6BB4jnycE9DsST2L
	 QVQDCRaC1IizvAyNPoXf5ErDaPanlu7D0FyZp45hIHIWrM3qbV38IwFs3OK0+RGeRH
	 yJufB9qLSgpI+yZFYj+ousYxofIh+jaw2SDvIxpVWEn7lHGBGnJJrXi3gJN2Yqsb00
	 lvYfbrNvoYtTaVbhngFIVvkbz/QEalguGnUt0deWU5BPQMcls+65zrorVdVfvW/ihJ
	 /uOKFIKQVC+ug==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id EB4822E0157; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        dardaoe <dardaoe@proton.me>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: ext4: fix group descriptor and superblock placement in meta_bg description
Date: Thu, 19 Nov 2026 09:46:48 -0500
Message-ID: <179509948716.1938961.14006923191664608594.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cJaripqlNO272O1fNRgrozKg2ocrVAPYS9w-1c-x1ltKdOsoNw9hWVKawqm7CoIhYb1pOwrTf6xxju_RKzajEmy8T1be_FuyQKKQ-GPGvB0=@proton.me>
References: <cJaripqlNO272O1fNRgrozKg2ocrVAPYS9w-1c-x1ltKdOsoNw9hWVKawqm7CoIhYb1pOwrTf6xxju_RKzajEmy8T1be_FuyQKKQ-GPGvB0=@proton.me>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 25 Oct 2026 13:16:21 +0000, dardaoe wrote:
> >From 98cec88bdaae2fd790adad67f3abb1e11ebb5623 Mon Sep 17 00:00:00 2001From: dardaoe <dardaoe@proton.me>
> Date: Sun, 25 Oct 2026 13:03:01 +0000
> Subject: [PATCH] Documentation: ext4: fix group descriptor and superblock
>  placement in meta_bg description
> 
> The Meta Block Groups section is imprecise in two places:
> 
> [...]

Applied, thanks!

[1/1] Documentation: ext4: fix group descriptor and superblock placement in meta_bg description
      commit: eda226e97998abf8ca5d24d8aabf9338e6f075ad

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
