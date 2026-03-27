Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124919C553;
	Fri, 27 Mar 2026 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591867; cv=none; b=kj6zKErHupCyCNezBI7aFr7jvNmLDuDuL2ogREhQuvmKYDM7pb35z7P/+M29ix5r2JE2ujca/wzYCZEJ+8MkK5wQmE5UAKTDTdCSlbO+CDJ+2zsA2h3Rx+wmy7jmR3Ayi2e3nIzNLfhhAoIW5t5XOuW/2/vR9lSGnc7I4vtTB+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591867; c=relaxed/simple;
	bh=fXoiOEsEgScsLpLNp0A6xEGJCzK5/EqYOvEoP0yGNuA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJEHfhIpclDH6Edo4Oa3YvpWXHpxAtparO9nrsXNQlRKeB6WwvnnztDfoJ5mzuMemIvCjX/LLPmuRVZowSS1S/tPZXePOkLrnxUA5uL4DzNvgans84mtlEffPcI44kxLdJXP9ts2U8HQhLrNjMAMFG/gsqUGvimPglHg2Nrw71s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ho45of8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ho45of8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAB3C19423;
	Fri, 27 Mar 2026 06:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774591867;
	bh=fXoiOEsEgScsLpLNp0A6xEGJCzK5/EqYOvEoP0yGNuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ho45of8kTecuJbHKQLFYbrpw1Ywljl+wWYiCukdYQImv3cO/MgdfBsxVAHaNUPJcm
	 i3HhR2HIWmfovX3ZrezM18KfqcjDr5Fd2HTvGta754VH2JMEZ1/2/wJtzSdiBYxltb
	 J0djcDV05We5sR3s3HbRxt/yB13nSx4IDxFQ/5KqWnh1ikB3K3bQVuQLqgf2vs4zyV
	 yi5UX0GnbFTTvhGFpsv9J+EdqsBVshblM3YvqvWPoiJxrBSMtKz3uCzv4/Lj+Z+tsr
	 owSywmhcjqEJ2dV8qIWTyI/Wn8junv9enlIIqArIK3UP2z1hYzfQiI8uaTccGeXUPc
	 CWJR/zCWfjXEg==
Date: Fri, 27 Mar 2026 07:11:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: kernel-doc overly verbose with V=0
Message-ID: <20260327071103.5569ad4f@foz.lan>
In-Reply-To: <297f6ef2-1760-4b85-a55e-73a2f061d641@intel.com>
References: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
	<20260325125020.533f2042@localhost>
	<297f6ef2-1760-4b85-a55e-73a2f061d641@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Mar 2026 13:42:44 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> On 3/25/2026 4:50 AM, Mauro Carvalho Chehab wrote:
> > On Tue, 24 Mar 2026 13:37:39 -0700
> > Jacob Keller <jacob.e.keller@intel.com> wrote:
> >   
> >> Hi,
> >>
> >> I recently saw some strange behavior with the Python kernel-doc. I was
> >> seeing the verbose info lines from the kernel-doc script, i.e.:
> >>  
> >>> Info: ice_ptp_hw.c:5377 Scanning doc for function ice_cgu_get_pin_freq_supp
> >>> Info: ice_ptp_hw.c:5406 Scanning doc for function ice_cgu_get_pin_name
> >>> Info: ice_ptp_hw.c:5441 Scanning doc for function ice_cgu_state_to_name
> >>> Info: ice_ptp_hw.c:5463 Scanning doc for function ice_get_dpll_ref_sw_status
> >>> Info: ice_ptp_hw.c:5505 Scanning doc for function ice_set_dpll_ref_sw_status
> >>> Info: ice_ptp_hw.c:5544 Scanning doc for function ice_get_cgu_state
> >>> Info: ice_ptp_hw.c:5612 Scanning doc for function ice_get_cgu_rclk_pin_info
> >>> Info: ice_ptp_hw.c:5671 Scanning doc for function ice_cgu_get_output_pin_state_caps
> >>> Info: ice_ptp_hw.c:5733 Scanning doc for function ice_ptp_lock
> >>> Info: ice_ptp_hw.c:5770 Scanning doc for function ice_ptp_unlock
> >>> Info: ice_ptp_hw.c:5782 Scanning doc for function ice_ptp_init_hw
> >>> Info: ice_ptp_hw.c:5811 Scanning doc for function ice_ptp_write_port_cmd
> >>> Info: ice_ptp_hw.c:5834 Scanning doc for function ice_ptp_one_port_cmd
> >>> Info: ice_ptp_hw.c:5866 Scanning doc for function ice_ptp_port_cmd
> >>> Info: ice_ptp_hw.c:5901 Scanning doc for function ice_ptp_tmr_cmd
> >>> Info: ice_ptp_hw.c:5934 Scanning doc for function ice_ptp_init_time
> >>> Info: ice_ptp_hw.c:5986 Scanning doc for function ice_ptp_write_incval
> >>> Info: ice_ptp_hw.c:6035 Scanning doc for function ice_ptp_write_incval_locked
> >>> Info: ice_ptp_hw.c:6056 Scanning doc for function ice_ptp_adj_clock
> >>> Info: ice_ptp_hw.c:6107 Scanning doc for function ice_read_phy_tstamp
> >>> Info: ice_ptp_hw.c:6134 Scanning doc for function ice_clear_phy_tstamp
> >>> Info: ice_ptp_hw.c:6164 Scanning doc for function ice_ptp_reset_ts_memory
> >>> Info: ice_ptp_hw.c:6183 Scanning doc for function ice_ptp_init_phc
> >>> Info: ice_ptp_hw.c:6215 Scanning doc for function ice_get_phy_tx_tstamp_ready
> >>> Info: ice_ptp_hw.c:6247 Scanning doc for function ice_check_phy_tx_tstamp_ready
> >>> Info: ice_ptp_hw.c:6273 Scanning doc for function ice_ptp_config_sfd
> >>> Info: ice_ptp_hw.c:6293 Scanning doc for function refsync_pin_id_valid    
> >>
> >> I didn't understand why I was seeing this as it should only be happening
> >> if running kernel-doc in verbose mode. Then I discovered I had set
> >> KBUILD_VERBOSE=0 in my environment.
> >>
> >> The python kernel-doc implementation reads this in the __init__ for
> >> KernelFiles() on line 165:
> >>  
> >>>         if not verbose:
> >>>             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))    
> >>
> >> After some debugging, I realized this reads KBUILD_VERBOSE as a string,
> >> then converts it to a boolean using python's standard rules, so "0"
> >> becomes true, which enables the verbose output.  
> > 
> > Looking at tools/docs/sphinx-build-wrapper, it implements verbosity
> > by doing:
> > 
> > 	verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
> > 
> > which will also have the same problem as the one you detected.
> >   
> 
> Yep.
> 
> > Perhaps the right fix would be to first convert to int then to bool
> > on both places, in a way that "" will also be handled properly.
> > Perhaps with:
> > 
> > 	try:
> > 	    verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
> > 	except ValueError:
> > 	    # Handles an eventual case where verbosity is not a number
> > 	    # like KBUILD_VERBOSE=""
> > 	    verbose = False  
> > >> This is in contrast to the (now removed) kernel-doc.pl script which  
> >> checked the value for a 1:
> >>  
> >>>  if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1')     
> >> The same behavior happens if you assign V=0 on the command line or to
> >> any other non-empty string, since when V is set on the command line it
> >> sets KBUILD_VERBOSE.  
> > 
> > That's funny... we did test make V=0 htmldocs / make V=1 htmldocs 
> >   
> 
> Strange. The Makefile does this:
> 
> ifeq ("$(origin V)", "command line")
>   KBUILD_VERBOSE = $(V)
> endif
> 
> I can see KBUILD_VERBOSE=0 from the top level Makefile, but you're right
> it doesn't seem to trigger the environment variable..
> 
> > It sounds that the problem is only if you explicitly set it without
> > relying on gnu make.
> >   
> 
> Adding some warn prints I do see the Makefile sets KBUILD_VERBOSE=0 when
> you do V=0.. and it has an export clause for KBUILD_VERBOSE
> 
> Oh, it might be your particular build doesn't have W=1 so checkdoc isn't
> being defined and thus kernel-doc isn't running?
> 
> If I do "make W=1 V=0" I do actually see these lines:
> 
> > Info: ../drivers/pci/pci.c:3646 Scanning doc for function pci_acs_init
> > Info: ../drivers/pci/pci.c:3663 Scanning doc for function pci_enable_atomic_ops_to_root
> > Info: ../drivers/pci/pci.c:3746 Scanning doc for function pci_release_region
> > Info: ../drivers/pci/pci.c:3772 Scanning doc for function __pci_request_region
> > Info: ../drivers/pci/pci.c:3820 Scanning doc for function pci_request_region
> > Info: ../drivers/pci/pci.c:3841 Scanning doc for function pci_release_selected_regions
> > Info: ../drivers/pci/pci.c:3879 Scanning doc for function pci_request_selected_regions
> > Info: ../drivers/pci/pci.c:3894 Scanning doc for function pci_request_selected_regions_exclusive
> > Info: ../drivers/pci/pci.c:3910 Scanning doc for function pci_release_regions
> > Info: ../drivers/pci/pci.c:3925 Scanning doc for function pci_request_regions
> > Info: ../drivers/pci/pci.c:3944 Scanning doc for function pci_request_regions_exclusive
> > Info: ../drivers/pci/pci.c:4026 Scanning doc for function pci_remap_iospace
> > Info: ../drivers/pci/pci.c:4062 Scanning doc for function pci_unmap_iospace
> > Info: ../drivers/pci/pci.c:4097 Scanning doc for function pcibios_setup
> > Info: ../drivers/pci/pci.c:4109 Scanning doc for function pcibios_set_master
> > Info: ../drivers/pci/pci.c:4136 Scanning doc for function pci_set_master
> > Info: ../drivers/pci/pci.c:4150 Scanning doc for function pci_clear_master
> > Info: ../drivers/pci/pci.c:4160 Scanning doc for function pci_set_cacheline_size
> > Info: ../drivers/pci/pci.c:4198 Scanning doc for function pci_set_mwi
> > Info: ../drivers/pci/pci.c:4229 Scanning doc for function pci_try_set_mwi
> > Info: ../drivers/pci/pci.c:4248 Scanning doc for function pci_clear_mwi
> > Info: ../drivers/pci/pci.c:4268 Scanning doc for function pci_disable_parity
> > Info: ../drivers/pci/pci.c:4285 Scanning doc for function pci_intx
> > Info: ../drivers/pci/pci.c:4310 Scanning doc for function pci_wait_for_pending_transaction
> > Info: ../drivers/pci/pci.c:4326 Scanning doc for function pcie_flr
> > Info: ../drivers/pci/pci.c:4366 Scanning doc for function pcie_reset_flr
> > Info: ../drivers/pci/pci.c:4443 Scanning doc for function pci_pm_reset
> > Info: ../drivers/pci/pci.c:4497 Scanning doc for function pcie_wait_for_link_status
> > Info: ../drivers/pci/pci.c:4527 Scanning doc for function pcie_retrain_link
> > Info: ../drivers/pci/pci.c:4592 Scanning doc for function pcie_wait_for_link_delay
> > Info: ../drivers/pci/pci.c:4642 Scanning doc for function pcie_wait_for_link
> > Info: ../drivers/pci/pci.c:4679 Scanning doc for function pci_bridge_wait_for_secondary_bus
> > Info: ../drivers/pci/pci.c:4818 Scanning doc for function pci_bridge_secondary_bus_reset
> > Info: ../drivers/pci/pci.c:5077 Scanning doc for function __pci_reset_function_locked
> > Info: ../drivers/pci/pci.c:5135 Scanning doc for function pci_init_reset_methods
> > Info: ../drivers/pci/pci.c:5167 Scanning doc for function pci_reset_function
> > Info: ../drivers/pci/pci.c:5214 Scanning doc for function pci_reset_function_locked
> > Info: ../drivers/pci/pci.c:5252 Scanning doc for function pci_try_reset_function  


> 
> >> Of course, I can remove KBUILD_VERBOSE from my environment, I'm not
> >> entirely sure when or why I added it.
> >>
> >> Would think it would make sense to update the kdoc_files.py script to
> >> check and interpret the string value the same way the perl script used
> >> to? It seems reasonable to me that users might set "V=0" thinking that
> >> it disables the verbosity. Other verbosity checks are based on the
> >> string containing a 1,  
> > 
> > kernel-doc has a set of "-W" flags to control its verbosity. Direct
> > support for KBUILD_VERBOSE was added there just to make it bug-compatible
> > with kernel-doc.pl when building via Makefile.
> >   
> 
> Right.
> 
> > Yet, as using it via "make htmldocs" don't use "-W", IMO it makes
> > sense to ensure that "-Wall" is enabled if V=1.
> >   
> 
> We enable -Wall if KBUILD_EXTRA_WARN contains a 2:
> 
> ifeq ($(KBUILD_EXTMOD),)
> ifneq ($(KBUILD_EXTRA_WARN),)
>   cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none
> $(KDOCFLAGS) \
>         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>         $<
> endif
> endif
> 
> If KBUILD_EXTRA_WARN has 2 we do -Wall, and if its any non-zero value we
> enable checkdoc. KBUILD_VERBOSE is handled internally to the script so
> not part of the Make invocation.
> 
> So V=0 only manifests if KBUILD_EXTRA_WARN is set.
> 
> We set KBUILD_EXTRA_WARN in top level:
> 
> ifeq ("$(origin W)", "command line")
>   KBUILD_EXTRA_WARN := $(W)
> endif
> 
> export KBUILD_EXTRA_WARN

Good point.

> 
> >> (some even use 2 for even more printing).  
> > 
> > Documentation had support for V=2, but this was dropped on this
> > commit:
> > 	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")
> >   
> 
> Looks like there's some stale leftover bits then:
> 
> #
> # If KBUILD_VERBOSE contains 1, the whole command is echoed.
> # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
> #
> # To put more focus on warnings, be less verbose as default
> # Use 'make V=1' to see the full commands
> I don't have strong opinions either way.
> 
> 
> >> I'm not entirely sure what the best implementation for python is to
> >> avoid this misinterpretation, so I haven't drafted a proper patch yet.  
> > 
> > Perhaps something like the patch below (untested).
> >   
> 
> The patch seems reasonable, though I don't know about the enabling other
> errors, as those are controlled by W=2 right now. I don't personally
> have objections to enabling them with V as well, but others might?

As W=2 already turns those, I opted to just apply the fix 
for KBUILD_VERBOSE without touching -W macros:

https://lore.kernel.org/linux-doc/7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org/T/#u


On a very quick test with:

	$ make W=2 V=0 drivers/pci/

and with:

	$ KBUILD_VERBOSE="asdf" ./scripts/kernel-doc drivers/pci/ -none
	$ KBUILD_VERBOSE="" ./scripts/kernel-doc drivers/pci/ -none
	$ KBUILD_VERBOSE="0" ./scripts/kernel-doc drivers/pci/ -none
	$ KBUILD_VERBOSE=0 ./scripts/kernel-doc drivers/pci/ -none

None of the above enabled verbosity.

Using either one of the above:

	$ KBUILD_VERBOSE=1 ./scripts/kernel-doc drivers/pci/ -none
	$ KBUILD_VERBOSE="1" ./scripts/kernel-doc drivers/pci/ -none

made it verbose.

So, I guess this should be enough to fix the issue. Please test
and reply to the patch if it works or not for you.

Thanks,
Mauro
