Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9293398E
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725655937; cv=none; b=ihfM2Most03lgNihbiBLtCit/TPjCqsFyRD8eCQx0q5YeWPgAJ8cd18iinGwYa2yDg/+MxYoqyRWgzdeUf4nwgkAlLyrv1+g4tbC2L/B/fCfdnqYZCq8NbQR7JGZenteTcGtOgIMw+2qMM0CcakCgoIWXOYUi5dZxEtC3xcypUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725655937; c=relaxed/simple;
	bh=k6wlknzFNe1EaXkaq+c4F/UHuw+NkLv4xBB96Ju3wvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfv9GxsiQtF3/AvTx450Sx67qjBShL2u9sEhN5FXwPk+DkWWtbDWO950WxsewE9Lga0XP9AYjurM+P+LCd/mMZOzNO37/xWGvanQvwrSFZPOv40aeim47h3+tjmkH4QnagPXDdHKNCQklhZBu2CHAHvQBksjsv1C5/XHUfe0oZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=MUNpLXws; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="MUNpLXws"
Received: from cwcc.thunk.org (pool-173-48-102-194.bstnma.fios.verizon.net [173.48.102.194])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 486Kq2dM018847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 16:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1725655924; bh=k6wlknzFNe1EaXkaq+c4F/UHuw+NkLv4xBB96Ju3wvU=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=MUNpLXwsnXBAWb+44Myls1LIVFFuBlPWFeLrHzJ0o4NGyKaJyMJSPWljaa/DpWyqW
	 oFXvbYBltdLO/1ROZDP06r8LwckBJOrbHMOphRFsKGmvjUcIveefBeHTHQ86OBWzaS
	 6mW1vnSSziw07nAxGaCc3qu7RyWYzAcrRlwfI7XSEUHcx6+93QNhhJpE4bdHR7kYEu
	 epkg8XkDrGO4jC+0PQExFXXD259+hRdnlK+JCAP7NwomzZxHJRUzkvqD7csz5JgIQy
	 7pVTmsTj9DEa0Mf6XkyBn7FJQHx5xhDDH7gk3+keBoEkVuh+RPDgMn7TJRPAAPIhQV
	 4NojT1uVmEj3Q==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 7D8FA15C1909; Fri, 06 Sep 2024 16:52:02 -0400 (EDT)
Date: Fri, 6 Sep 2024 16:52:02 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dennis Lam <dennis.lamerice@gmail.com>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs:filesystems: fix spelling and grammar mistakes
Message-ID: <20240906205202.GX9627@mit.edu>
References: <20240906195400.39949-1-dennis.lamerice@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906195400.39949-1-dennis.lamerice@gmail.com>

On Fri, Sep 06, 2024 at 03:53:52PM -0400, Dennis Lam wrote:
> Signed-off-by: Dennis Lam <dennis.lamerice@gmail.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

