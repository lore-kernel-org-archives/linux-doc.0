Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443EB3090D9;
	Mon, 19 Jan 2026 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818450; cv=none; b=ntWeH8T3olrApXvTqXE9+gtBltst9HVqPBzsg8zUgsU8z6hDtA13xF13TB8dOtPpHVvtikSdLxh/UicWV7coxRoc9eWG1HzcCIoJUz5VZVOS/JHFXqtndnMESWc5ciL+FiCANIbIXxer3oXqYPbqc+rIF4Bd2sbvZxKye1WiFEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818450; c=relaxed/simple;
	bh=SaKAiIwbYX8VbXjWRjRdgrOUPR9xr5Jk3dnUZ1nX1fg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsQWS/EKNEO6SONbQ8wGmmHqp11ZjtaastcGpeg6lWcvX4TGIw2vnT6spi7494f8B7r+Nfdp8b/osstTwjEvWsNhgwtP+Q6dLshZ511WtusavlxEdwEyhXk4iEYQWBK+OmrZdR7bsYRKkPe7zajRKwMR5P4LZRgCQkIB/Fk4Ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3Ddzlhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3Ddzlhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7587FC116C6;
	Mon, 19 Jan 2026 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768818449;
	bh=SaKAiIwbYX8VbXjWRjRdgrOUPR9xr5Jk3dnUZ1nX1fg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J3Ddzlhp4RMkim7SsafxDwRs8buOmXlgOKZATnKY4ZLzWXMMTts1ItrYht/H1bslL
	 RTBk2ho5xY4cCSbpKUsOWKdXZ063zsTgU/PB2sm320lx6bsr3LVuQ+CJok7x8gDTV6
	 yqGuPGypQNy6oMb3ygM4dqx2JRW9sx2fEtlDWFJ/fSLilFS5PdvnTN85nWsCVL53AQ
	 jjHdsib/y8T85Gk6o5GWa0Buri0Qt3MhtBviY1FvXM7+NRmE2scawyQTgY2Ydvj2FZ
	 d5dEeowcDScILKYNvaraz0aOf12LSmdWo+vO0wzq4QJ/1JjJHbJnVBm9sfOtISUPel
	 FIaIvOWbw8FlA==
Date: Mon, 19 Jan 2026 11:27:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/2] Move kernel-doc to tools/docs
Message-ID: <20260119112725.67b364f7@foz.lan>
In-Reply-To: <20260114164146.532916-3-corbet@lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<20260114164146.532916-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 09:41:44 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> kernel-doc is the last documentation-related tool still living outside of
> the tools/docs directory; the time has come to move it over.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

...

> diff --git a/scripts/kernel-doc.py b/tools/docs/kernel-doc
> similarity index 100%
> rename from scripts/kernel-doc.py
> rename to tools/docs/kernel-doc

As reported by kernel test robot:
	 https://lore.kernel.org/linux-doc/202601191546.Bvd74asP-lkp@intel.com/

Here, you also need to change the relative location of the modules:

	 # Import Python modules

	-LIB_DIR = "../tools/lib/python"
	+LIB_DIR = "../lib/python"
	 SRC_DIR = os.path.dirname(os.path.realpath(__file__))

	 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))

Thanks,
Mauro
