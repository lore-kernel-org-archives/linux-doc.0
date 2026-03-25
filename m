Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65E332919;
	Wed, 25 Mar 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439450; cv=none; b=lETBgtj0kmm92uR2Ldd+mx5SYKW37BKUgP01USdUYlkdedESyyxAeUMKEbaNu28zGYsE/ZdD7AnYEZ7MZCx1xZgcxR3ppOe3I+DJCJFsON/QnYUPrrAmkKZuqBCmyETEX5pg57BiW5zivbsFtUeQSboqXn3QY6sAb2P8Wn9Gh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439450; c=relaxed/simple;
	bh=dAC+WHcAdAWz9iJR6CXbXNrDKvcmgbjixQSj7+RodpA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQRiK/eUivrIvmeCqhnstfhaRoUxYl/2D7RhdTaP65NMSknGjFUOdztsvTnBVTz/zLMO2gJ5n+ozYtimcDj4F3dtMaHN9xnIzrPg1LB81mFZVJhM7oa351MXcqdASCXsDZK+SzQJtS+rQjGLdqQseJnyN5Cg7i+BIvP2tiNZL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuiV8LBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuiV8LBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D44C4CEF7;
	Wed, 25 Mar 2026 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439450;
	bh=dAC+WHcAdAWz9iJR6CXbXNrDKvcmgbjixQSj7+RodpA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BuiV8LBcTXlRdQKHVnPLoSuHOPpKXnrh/OX/zgtfF4WjAPRAp/LTfyrPSeSf3a86Z
	 LHVR7Wklf255l3t9b77mDFs65Z9JXDhxQnRFAhk+fiHaDmWP2cTHwlatfgS1r3fUPQ
	 MXXSJDPntu5d1lRsKgS4b5ZjRGzFasgIeaCFUVEytKC/BK50uwBJq3c+g8OZOAyZ8O
	 nHa1V/TfSPHakalUi7zYP7hmGBxe71D+x9aUdTStXiyRONhx5TLkicXVNDyQ/uBen7
	 XMvr5CeJ1L1+dQAmfK0Mz0SaerT7C3BanF0BhvTcxPFerFKPlXzesgAkz9ARaU/zB8
	 wn9vB5Q3cuYWw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w5Ml5-0000000Fsf8-3Lq8;
	Wed, 25 Mar 2026 12:50:47 +0100
Date: Wed, 25 Mar 2026 12:50:46 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: kernel-doc overly verbose with V=0
Message-ID: <20260325125020.533f2042@localhost>
In-Reply-To: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
References: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 13:37:39 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> Hi,
> 
> I recently saw some strange behavior with the Python kernel-doc. I was
> seeing the verbose info lines from the kernel-doc script, i.e.:
> 
> > Info: ice_ptp_hw.c:5377 Scanning doc for function ice_cgu_get_pin_freq_supp
> > Info: ice_ptp_hw.c:5406 Scanning doc for function ice_cgu_get_pin_name
> > Info: ice_ptp_hw.c:5441 Scanning doc for function ice_cgu_state_to_name
> > Info: ice_ptp_hw.c:5463 Scanning doc for function ice_get_dpll_ref_sw_status
> > Info: ice_ptp_hw.c:5505 Scanning doc for function ice_set_dpll_ref_sw_status
> > Info: ice_ptp_hw.c:5544 Scanning doc for function ice_get_cgu_state
> > Info: ice_ptp_hw.c:5612 Scanning doc for function ice_get_cgu_rclk_pin_info
> > Info: ice_ptp_hw.c:5671 Scanning doc for function ice_cgu_get_output_pin_state_caps
> > Info: ice_ptp_hw.c:5733 Scanning doc for function ice_ptp_lock
> > Info: ice_ptp_hw.c:5770 Scanning doc for function ice_ptp_unlock
> > Info: ice_ptp_hw.c:5782 Scanning doc for function ice_ptp_init_hw
> > Info: ice_ptp_hw.c:5811 Scanning doc for function ice_ptp_write_port_cmd
> > Info: ice_ptp_hw.c:5834 Scanning doc for function ice_ptp_one_port_cmd
> > Info: ice_ptp_hw.c:5866 Scanning doc for function ice_ptp_port_cmd
> > Info: ice_ptp_hw.c:5901 Scanning doc for function ice_ptp_tmr_cmd
> > Info: ice_ptp_hw.c:5934 Scanning doc for function ice_ptp_init_time
> > Info: ice_ptp_hw.c:5986 Scanning doc for function ice_ptp_write_incval
> > Info: ice_ptp_hw.c:6035 Scanning doc for function ice_ptp_write_incval_locked
> > Info: ice_ptp_hw.c:6056 Scanning doc for function ice_ptp_adj_clock
> > Info: ice_ptp_hw.c:6107 Scanning doc for function ice_read_phy_tstamp
> > Info: ice_ptp_hw.c:6134 Scanning doc for function ice_clear_phy_tstamp
> > Info: ice_ptp_hw.c:6164 Scanning doc for function ice_ptp_reset_ts_memory
> > Info: ice_ptp_hw.c:6183 Scanning doc for function ice_ptp_init_phc
> > Info: ice_ptp_hw.c:6215 Scanning doc for function ice_get_phy_tx_tstamp_ready
> > Info: ice_ptp_hw.c:6247 Scanning doc for function ice_check_phy_tx_tstamp_ready
> > Info: ice_ptp_hw.c:6273 Scanning doc for function ice_ptp_config_sfd
> > Info: ice_ptp_hw.c:6293 Scanning doc for function refsync_pin_id_valid  
> 
> I didn't understand why I was seeing this as it should only be happening
> if running kernel-doc in verbose mode. Then I discovered I had set
> KBUILD_VERBOSE=0 in my environment.
> 
> The python kernel-doc implementation reads this in the __init__ for
> KernelFiles() on line 165:
> 
> >         if not verbose:
> >             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))  
> 
> After some debugging, I realized this reads KBUILD_VERBOSE as a string,
> then converts it to a boolean using python's standard rules, so "0"
> becomes true, which enables the verbose output.

Looking at tools/docs/sphinx-build-wrapper, it implements verbosity
by doing:

	verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")

which will also have the same problem as the one you detected.

Perhaps the right fix would be to first convert to int then to bool
on both places, in a way that "" will also be handled properly.
Perhaps with:

	try:
	    verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
	except ValueError:
	    # Handles an eventual case where verbosity is not a number
	    # like KBUILD_VERBOSE=""
	    verbose = False

> This is in contrast to the (now removed) kernel-doc.pl script which
> checked the value for a 1:
> 
> >  if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1')   
> The same behavior happens if you assign V=0 on the command line or to
> any other non-empty string, since when V is set on the command line it
> sets KBUILD_VERBOSE.

That's funny... we did test make V=0 htmldocs / make V=1 htmldocs 

It sounds that the problem is only if you explicitly set it without
relying on gnu make.

> Of course, I can remove KBUILD_VERBOSE from my environment, I'm not
> entirely sure when or why I added it.
> 
> Would think it would make sense to update the kdoc_files.py script to
> check and interpret the string value the same way the perl script used
> to? It seems reasonable to me that users might set "V=0" thinking that
> it disables the verbosity. Other verbosity checks are based on the
> string containing a 1,

kernel-doc has a set of "-W" flags to control its verbosity. Direct
support for KBUILD_VERBOSE was added there just to make it bug-compatible
with kernel-doc.pl when building via Makefile.

Yet, as using it via "make htmldocs" don't use "-W", IMO it makes
sense to ensure that "-Wall" is enabled if V=1.

> (some even use 2 for even more printing).

Documentation had support for V=2, but this was dropped on this
commit:
	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")

> I'm not entirely sure what the best implementation for python is to
> avoid this misinterpretation, so I haven't drafted a proper patch yet.

Perhaps something like the patch below (untested).

-- 
Thanks,
Mauro

[PATCH] doc tools: better handle KBUILD_VERBOSE

As reported by Jacob, there are troubles when KBUILD_VERBOSE is
set at the environment.

Fix it on both kernel-doc and sphinx-build-wrapper.

Reported-by: Jacob Keller <jacob.e.keller@intel.com>
Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 2c63d28f639d..1bb962202784 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -238,7 +238,12 @@ class SphinxBuilder:
             self.latexopts = os.environ.get("LATEXOPTS", "")
 
         if not verbose:
-            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
+            try:
+                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
+            except ValueError:
+                # Handles an eventual case where verbosity is not a number
+                # like KBUILD_VERBOSE=""
+                verbose = False
 
         if verbose is not None:
             self.verbose = verbose
diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 2428cfc4e843..40984ea78f12 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -238,7 +238,22 @@ class KernelFiles():
         """
 
         if not verbose:
-            verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))
+            try:
+                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
+            except ValueError:
+                # Handles an eventual case where verbosity is not a number
+                # like KBUILD_VERBOSE=""
+                verbose = False
+
+            #
+            # kernel-doc logic was likelly called via Sphinx.
+            # Enable all warnings.
+            #
+            if verbose:
+                werror=True
+                wreturn=True
+                wshort_desc=True
+                wcontents_before_sections=True
 
         if out_style is None:
             out_style = OutputFormat()

