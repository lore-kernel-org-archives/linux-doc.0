Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D72FF66B;
	Tue, 21 Apr 2026 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792548; cv=none; b=FzmRq0E8Nn602HVR3yaXf6aYGbhsPIBUbRCB4LcNr4MfoaM0TYyadn2yHRqcpzhQlqkjBaNAiX/F5ieyusSHaKGtDqNoZqbNtQEVcuG7uZRgZmt4lzMu+p2YqFiZ0ACY7vHKhbctdrXlLjlTOT0tlMUoinQ/o/XK5oIGCOp0to8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792548; c=relaxed/simple;
	bh=vTmrYEHnqYnVUx8iDfIy0TZqyzfVGacK9eDUXDQJOaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDC1AQc5aDQ5t5fexBIwE+ePlwXnn2pwUlUVaM1gTd/PdVGuuFyGL4EPiqbw6xalcECvLHbtaMGlHkO2yKQfZQ7Z+YYw7VtFQd3eXrBKAHEtrV7HfCnnUXtqF6V7DjY9qdqM8Ovq+f8Itj6IOK0ljC3EPfvpctJJLl7FhUxB6KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqDXLX+H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqDXLX+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87B7C2BCB0;
	Tue, 21 Apr 2026 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792547;
	bh=vTmrYEHnqYnVUx8iDfIy0TZqyzfVGacK9eDUXDQJOaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqDXLX+HxyI6V99BXd+2HAyODK70u/kQevMvu+wHTmvFW6Ph/nDdSV8HYqDCg3L+0
	 QGlLHdGZWjDUGFWW/9MEoqiXvbBzT6a3djeOnK8YRZQ7cIkh91260YlXM8yxGWRdRI
	 Pv5lyqsUckfkVw+ebbc6iGI0XlBOEQ4teKuGzmIXziAxgdkWWxCP32p1d7cG+fZK1S
	 Cja3jK/IUz1we5+M7xIr5HkVQPZbD0nJyTMWErznFXZvOZrZMQG66FWqOTEOp9wzEJ
	 oUOBKE0ooNo1QPlbLQ8c71fOgARz4t3f3LYmdEbaPjUIJecoUEnAsMUpuWc3SKt3kM
	 oc3j1ohtFmP1A==
Date: Tue, 21 Apr 2026 10:29:07 -0700
From: Kees Cook <kees@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation/binfmt-misc.rst: Clarify "P" flag
Message-ID: <202604211026.C462A59EC0@keescook>
References: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>

On Sun, Apr 19, 2026 at 12:11:01AM -0400, Charlie Jenkins wrote:
> Improve the wording of the description of the "P" flag to explain that
> the interpreter gets the path to the file provided by execve and not the
> full path as well as documenting that AT_FLAGS can be read to see if the
> "P" flag is set.

Thanks for the clarifications! I'll get this into the execve tree once
the merge window is over. (I usually wait for -rc2 to be released.)
(Or maybe this should go via linux-doc? I should add this file to the
EXEC entry in MAINTAINERS...)

How did you happen across this mismatch(?weakness?) in the docs?

-Kees

-- 
Kees Cook
