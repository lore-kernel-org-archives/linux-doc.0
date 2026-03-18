Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410791DE2A5
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838591; cv=none; b=LhO0O9vneMMX9Ane5JrS4KfT4BixTI3AGtx1K5IGxMYtdB6rWB3P260PdGczMpj3PP2Fc/lKoPQz5snVIO1GJPAe2GT80R6rgERBSD2RqvLAqbTEzs4PyrxdnTlCwD+cc+bSfc8utMcCxIfuY/hn8nfnmtsGdH7nKUAbIoUyKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838591; c=relaxed/simple;
	bh=BOwWelHQTIyu8menfnXgkFofSYHhG/5NOIjSa8wzmrg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ZCbSLp1lV4o2J5B4kE/9D3TPDv1PI4LsYymWRjg7cTqsjJQLd++FPrLPrIq21+sCXuuhEvz7A1uLVAOTQbJoNnAgqiOmMWZHMEJaKGycS4Ia+UuUWUhAUumwTmBP/oyDDxsgfG9ms0WGMQjX6THDWN2CMuDY5hQfLpimOnmw79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92EDB1E7D;
	Wed, 18 Mar 2026 05:56:23 -0700 (PDT)
Received: from [10.57.60.246] (unknown [10.57.60.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 821C03F778;
	Wed, 18 Mar 2026 05:56:28 -0700 (PDT)
Message-ID: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
Date: Wed, 18 Mar 2026 13:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
Subject: Invalid link generation for equations
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I have noticed that links to equation images are not generated correctly
on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:

    .. math::
    
       NR\_MEM\_SECTIONS = 2 ^ {(MAX\_PHYSMEM\_BITS - SECTION\_SIZE\_BITS)}

The generated HTML [1] shows the source code instead of the rendered
equation because the link to the image [2] is broken. [3] does however
exist. The issue seems to be that the link is relative to the root, even
though we are in a subfolder (mm/ here).

Given my non-existent knowledge of Sphinx I have no idea what the fix
might be, but I thought I'd report this at least :)

- Kevin

[1] https://docs.kernel.org/mm/memory-model.html#sparsemem
[2]
https://docs.kernel.org/mm/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87d079.png
[3]
https://docs.kernel.org/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87d079.png

