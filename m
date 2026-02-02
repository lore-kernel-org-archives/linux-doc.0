Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC52BEC2C
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056110; cv=none; b=RawzeThy11TfRjV5Dag/iT7KGeGUH2qb6EBCH8zNc9aE2lDjO3XMVpdM1dP3g7aAHuP/8gmA+SlYxNDKhRG0PDjPzeFORz+7ruwtlchMZTlNjrPFgRUi31vQ0KMg5uTATOHyk7gp8B+TfVqFqlBVIcc/rHjxNR5DQp4+ewbUesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056110; c=relaxed/simple;
	bh=uYU+UjGaHRwL3bTehmXjsmKVViIaqfL1AqdHtt2ux/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xk1m2EmukW6WXpP5zx6VNRTtFYp0wwhVZ5TF8em9DVnFiW6lgTZjSfSQmJWdquBRO5UJHLoTmDiHg8h3zlyDiYEK0EE1lzSGFhJRnoDZShmkG/mBhe3fEbDUg6OxUSzpOwXSWNkl8lUhaxCcjMoPtfuNkE5Ul8sGM4osKlac1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcpvyglW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcpvyglW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA95C116C6;
	Mon,  2 Feb 2026 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770056110;
	bh=uYU+UjGaHRwL3bTehmXjsmKVViIaqfL1AqdHtt2ux/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IcpvyglWbRMg70AAfdhjvJggGwQ+vOKAHNgwrMCqVGdLzzFJDZTu5g3gf5U05Stjb
	 5MtCzNPOtLBOx704NUiq+ox6Bv6QjaYsu8Y26fFoyBV5SQhf810EduaKtD0M7p48HQ
	 yuxK+N9zX6TTReHHNQe5iKJkmVFYz6jq7WlBbDbiXhR+PE0/tPgqFKSIhSBpjYLEeA
	 FZh7W9bzlkEKXOujVDPuaxfBVJPGEPNji5h12Cjj98o8JPACC5E+d5kYeqO5rjKaci
	 04JoeDjTo75aGme8qFTMx6JLssDVwRz/p/H1xNKoVJ6+05G6DH2cGjGS5dvI4OU6/W
	 1ylEvhp5YtmTg==
Date: Mon, 2 Feb 2026 19:15:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
Message-ID: <20260202191506.0aaee18e@foz.lan>
In-Reply-To: <87bji7rsf9.fsf@trenco.lwn.net>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
	<87bji7rsf9.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jon,

On Mon, 02 Feb 2026 10:01:14 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This small series contain 3 patches:
> > - patch 1 fixes PDF docs build, as reported by Akira;
> >   (I'm resending this one as-is from its v2)
> > - patch 2 addresses a complain from Jani about not being able
> >   of disabling "-q" flag when building docs with V=0;
> > - patch 3 addresses an issue indirectly reported by Jani that
> >   it the env vars that affects the wrapper aren't documented.
> >
> > With regards to patch 2, docs build honours V=0 by adding a
> > "-q" flag.
> >
> > When V=1 is set, there are two effects in place:
> >
> > 1. sphix-build will be called without "-q";
> > 2. Sphinx extensions will increase their verbosity levels.
> >
> > Sometimes, it is desired to just remove "-q" without increasing
> > extensions verbosity. That's what patch 2 does.
> >
> > IMO, at least patch 1 should be merged during Kernel v6.21
> > development cycle.
> >
> > Mauro Carvalho Chehab (3):
> >   docs: kdoc: Fix pdfdocs build for tools
> >   docs: sphinx-build-wrapper: allow -v override -q
> >   tools: sphinx-build-wrapper: improve its help message
> >
> >  tools/docs/sphinx-build-wrapper  | 42 +++++++++++++++++++++++++++-----
> >  tools/lib/python/kdoc/kdoc_re.py | 10 +++++---
> >  2 files changed, 43 insertions(+), 9 deletions(-)  
> 
> I've applied this set, thanks.

Thanks!

-

Jon,

I ended placing this series near the end of the /41 one mainly because
the first patch conflicts there.

The conflict is trivial, to solve though, if you opt to merge
from it.

IMO, it is worth merging this series before the merge window,
as it will solve some troubles that will appear after Linus
picks stuff from -next, related to some annotations Peter
Zijlstra added on his tree, but it is up to you.

Yeah, it is a lot more complex than I would expect for a late
-rc, so we could end just postpone it.

---

As a heads up, I'm working on a separate set of patches that, if 
things go well, we may end having a regression test for kernel-doc.
When done, I'll be submitting in separate.

The idea is to have a YAML file with source code, KdocItem,
man output and rst output, and a dynamic unit test to run
them. I finished today to write a skeleton, but still requires
polishing (*).

I'm thinking on modifying kernel-doc executable to be able
to generate the content for such YAML file.

If things go well, we could have something like:

	$ tools/docs/kernel-doc --gen-yaml all_kdoc_tests.yaml .

To place all tests there. As we modify kernel-doc, we can
run the code I'm currently writing. It would identify the
differences for both ReST and man and report.
	
(*) I started working on it today.

The unittest generation part from YAML already works:

	$ tools/unittests/test_kdoc_from_yaml.py 
	Ran 3 tests in 0.004s

	FAILED (failures=1)
	test_kdoc_from_yaml:
	    KernelDocParser:
	        test_gen_function3:  FAIL
	    KernelManOutput:
	        test_man_function3:  OK
	    KernelRestOutput:
	        test_rst_function3:  OK

Those 3 classes were auto-populated from yaml. Right now,
only KernelDocParser test exectution was implemented.

Those three classes contain just the test functions (two are just
stubs):

	class KernelDocParser(KdocParser):
	    def run_parser_test(self, source, kdoc_item, exports, fname):
	        if isinstance(kdoc_item, dict):
	            kdoc_item = [kdoc_item]

        	if isinstance(exports, str):
        	    exports=set([exports])
        	elif isinstance(exports, list):
        	    exports=set(exports)

		# For now, it is using here a function I wrote on a non-dynamic unit test
	        self.run_test(source, kdoc_item, exports=exports, fname=fname)

	class KernelManOutput(unittest.TestCase):
	    # TODO: for now, this is just a stub
	    def run_out_test(self, kdoc_item, out_type, data):
	        pass

	class KernelRestOutput(unittest.TestCase):
	    # TODO: for now, this is just a stub
	    def run_out_test(self, kdoc_item, out_type, data):
	        pass

And It contains a separate class to add dynamic tests on those.

The only issue I need to handle on its current implementation for
KernelDocParser (with the simple YAML test) is to solve whitespace
issues:

	FAIL: test_gen_function3 (test_kdoc_from_yaml.KernelDocParser.test_gen_function3)
	Lambda-like function to run tests with provided vars
	----------------------------------------------------------------------
	Traceback (most recent call last):
	  File "/new_devel/docs/tools/unittests/test_kdoc_from_yaml.py", line 79, in test_method
	    self.run_parser_test(source, kdoc_item, exports, fname)
	    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	  File "/new_devel/docs/tools/unittests/test_kdoc_from_yaml.py", line 54, in run_parser_test
	    self.run_test(source, kdoc_item, exports=exports, fname=fname)
	    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	  File "/new_devel/docs/tools/unittests/test_kdoc_parser.py", line 84, in run_test
	    self.assertEqual(d[key], value, msg=f"at {key}")
	    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	AssertionError: {'Description': 'Does nothing\n\n', 'Return': '\nalways return 0.\n'} != {'Description': 'Does nothing\n', 'Return': 'always return 0.\n'}
	- {'Description': 'Does nothing\n\n', 'Return': '\nalways return 0.\n'}
	?                                --              --
	
	+ {'Description': 'Does nothing\n', 'Return': 'always return 0.\n'} : at sections

I'll probably add a regex to replace all whitespaces/new lines by a
single one.

For man pages, I need to handle timestamps, but except for that and
whitespace differences, both rst and man page functions should be
straight forward: just call the output class passing the list of
KdocItem objects.

I guess tomorrow I may have this fixed and the test functions for
rst and man implemented.

Thanks,
Mauro

---

If you're curious enough, this is the test YAML file it is using to
generate the 3 dynamic unit tests:

tests:
  - name: function3
    fname: function3.c
    description: Just a simple example

    source: |
      /**
      * function3: Exported function
      * @arg1: @arg1 does nothing
      *
      * Does nothing
      *
      * return:
      *    always return 0.
      */
      int function3(char *arg1) { return 0; };
      EXPORT_SYMBOL(function3);

    exports: function3
    expected:
      - kdoc_item:
          name: function3
          type: function
          declaration_start_line: 1

          sections:
            Description: |
              Does nothing

            Return: |
              always return 0.

          parameterdescs:
            arg1: |
              @arg1 does nothing
          parameterlist:
            - arg1
          parameterdesc_start_lines:
            arg1: 2
          parametertypes:
            arg1: char *arg1

          other_stuff:
            func_macro: false
            functiontype: int
            purpose: Exported function
            typedef: false

        rst: |
          .. c:function:: int function3 (char *arg1)

            Exported function

          .. container:: kernelindent

            **Parameters**

            ``char *arg1``
              **arg1** does nothing

            **Description**

            Does nothing

            **Return**

            always return 0.

        man: |
          .TH "function3" 9 "February 2026"  "" "Kernel API Manual"
          .SH NAME
          function3 \- Exported function
          .SH SYNOPSIS
          .B "int" function3
          .BI "(char *arg1 "  ");"
          .SH ARGUMENTS
          .IP "arg1" 12
          \fIarg1\fP does nothing
          .SH "DESCRIPTION"
          Does nothing
          .SH "RETURN"
          always return 0.
          .SH "SEE ALSO"
          .PP
          Kernel file \fBtest.c\fR
