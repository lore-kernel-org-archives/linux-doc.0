Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890B78B44
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707194546; cv=none; b=bmKuYMZEUSHRT4lgUQl9gG94ESBzIVcgMl2+/gOdlEzr5MyC52y+lxvMgLcW06xGCtuzFn+9z8VwJiY4R6r9Xq8kinVFStZfM43nCbX4l7kiTkDzbS3JoI1UfiAV6utNDVczz/mZIagnphXjwrE7JHlWe0TGuKutZMO5kq7Ymq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707194546; c=relaxed/simple;
	bh=7w1ccy+T8gcTw24mhIVt/IYbyFu/WjFl8/t6fNm2nDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gemIwuMgwxbtC+y4cu5urhK7mEOGkB6pOTTw3wVPIuZJux/N3hEtbForkZFrKr73CjDi1Ld2Drzr5kzltXXpl58lEHnjjFbHeZ38zranRN5ifdQnayx4cl65F+cP7cTQZ6lRXsnyJOqal7O15z+lCwgiGnOfZrbHAidc1qqHeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmbDPiTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmbDPiTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4A7C433F1;
	Tue,  6 Feb 2024 04:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707194545;
	bh=7w1ccy+T8gcTw24mhIVt/IYbyFu/WjFl8/t6fNm2nDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nmbDPiTQgh3a2mEoiFYDo8IY1vLfPFa8a0xIE5SI+Ae13M86IVsAl9BKm2DqscRbi
	 1u8Ggyi4ZZ/axcimnzwI8K9A3MqnvLMaJ0RpCT98K9POOlT0jJRfnNhXezUJMb7dpa
	 8U+aksOqy3qtlgOw2BHkg5KWhHVhhJFVw5DjdRvFL5mijyIMXbx6w2rfsWndfc27I2
	 z9jr4DLrj6jkXvK/vaWMsG/sfFIVh+YEKeWrZlhSsYonZK3Wx4pj9MggVg5nq6+Nt7
	 2siy+ghMbt0HqPdmwHG4rjn3psDFXFHk2ZY7QbJGFBl/z0+S0YyU5PTIKOObrna2zo
	 GLcK7R3ZSD5KQ==
Date: Tue, 6 Feb 2024 05:42:21 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/8] doc: kernel_feat.py: convert to sphinx.util.logging
Message-ID: <20240206054221.429b1fd4@coco.lan>
In-Reply-To: <20240205175133.774271-5-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-5-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:29 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/kernel_feat.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
> index 3493621d1a4e..f1c9e4a54964 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -41,10 +41,13 @@ from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
>  from docutils.utils.error_reporting import ErrorString
> +from sphinx.util import logging
>  from sphinx.util.docutils import switch_source_input
>  
>  __version__  = '1.0'
>  
> +logger = logging.getLogger(__name__)
> +
>  def setup(app):
>  
>      app.add_directive("kernel-feat", KernelFeat)
> @@ -67,12 +70,6 @@ class KernelFeat(Directive):
>          "debug"     : directives.flag
>      }
>  
> -    def warn(self, message, **replace):
> -        replace["fname"]   = self.state.document.current_source
> -        replace["line_no"] = replace.get("line_no", self.lineno)
> -        message = ("%(fname)s:%(line_no)s: [kernel-feat WARN] : " + message) % replace
> -        self.state.document.settings.env.app.warn(message, prefix="")
> -

That doesn't sound right.

If you remove the logic which gets the actual file name and line where
the error/warning have occurred, how are you handing now the special
output with such data produced by get_abi.pl to return the real file
name/line number where the error occurred?

Had you test changing an ABI file to cause a Sphinx warning and
ensured that the produced warning will report the actual location
of the warning, instead of shooting the messenger?

>      def run(self):
>          doc = self.state.document
>          if not doc.settings.file_insertion_enabled:

Thanks,
Mauro
