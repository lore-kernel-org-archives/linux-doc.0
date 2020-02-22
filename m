Return-Path: <SRS0=5qo6=4K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5802FC35669
	for <linux-doc@archiver.kernel.org>; Sat, 22 Feb 2020 08:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12903208C4
	for <linux-doc@archiver.kernel.org>; Sat, 22 Feb 2020 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582360894;
	bh=fP8dAmEgmMSaqs7T9UiNp8NvtQbObYZNh6/EJTvm5NE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=cDjcSTrORD+PmRXgy447AcTxxnoGibobwXHVXR/MBgNYgS9Cqt/TcZPKSbLEpqwlB
	 g6C4OPBZrkoE0ryp86vvJKaRY3FAv/zAELkTLr61pk6Z8AdMbDZM/bZ9gfTwduKnFJ
	 fBOlCJ8gaauop5ONaZaXMKm9oG7bKEAqW4hF31HQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgBVIld (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Feb 2020 03:41:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58594 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgBVIld (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Feb 2020 03:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=TjCQlVI6CqKzMf5seODt5uXR6U9Pvwq7In+4wyWWutY=; b=LWhbT548tBdG0CbGwqj1gQw7S2
        Sjl8H4Goko24gc/8BZyQ8ezhhib7rSXugFFLPmdlOHZqfNLpMz96e52GCpfz2wgImNgtLQVp2sFn6
        ANCsWqTP9SjGDKcFOavqAtgBX3zQWTyVniwYVunRVWKuDhsoi0Cz9Wc7SL2kKM5r1g3Qo3tYnOZo4
        1HtsKG7i6HGERNuXJn1o5/kdeDnk+2weVRZeC69acgXUuzJUHLquPhBDNCS9pP042Zt0fQfSkQgJN
        w04yKj80sxZGXuCg093rPacTzi/rrndK/HrPzYvHoroPeNwstIVJM5AjE1LkiVU+CgPXDh990I+Fj
        V6z5u9OA==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5QLq-0000H7-Px; Sat, 22 Feb 2020 08:41:31 +0000
Date:   Sat, 22 Feb 2020 09:41:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: "staging" area for unsorted random files under
 Documentation/*.rst
Message-ID: <20200222094127.1b2bf4c4@kernel.org>
In-Reply-To: <20200220062934.552d2941@kernel.org>
References: <20200218113219.7b7cc460@kernel.org>
        <87v9o4ulnd.fsf@intel.com>
        <20200219022951.6127e48b@lwn.net>
        <20200220062934.552d2941@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 20 Feb 2020 06:29:34 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> > In general, RST conversion is not my highest priority at this point.  
> 
> Well, right now on my TODO list there are just ~20 files left to convert.
> 
> I'm excluding from my TODO a few exceptions like config files with .txt 
> extensions and translations, plus a couple of text files whose previous
> conversion attempts generated heated discussions.
> 

Btw, finished the conversion yesterday. If you want to do a sneak pick,
it is at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all_docs_merged_v2
	
And the html output at:

	https://www.infradead.org/~mchehab/kernel_docs/devicetree/

The series contain 285 patches. the diffstat is big, but lots of the
things there are just fixing broken references due to .txt to .rst
renames (see enclosed). The actual changes are at filesystems,
networking, RCU, misc, devicetree (only the actual docs were touched),
and on a few other random places.

Yeah, I know it will be painful to review and apply those. I already
sent some of the patch series for review. I should be sending the
remaining series along the next couple weeks.

Cheers,
Mauro

-

PS.: as you may notice, the rename RFC patch is applied here. This is
just for helping me to check if I didn't miss anything. As I said,
I won't be submitting it as-is.

Right now, the script I'm using to check what's missing conversion
points to just a bunch of stuff:

$ ./nonconverted_docs.sh 
Documentation/memory-barriers.txt
Documentation/firmware_class/hotplug-script
Documentation/RCU/RTFP.bib
Documentation/networking/mac80211-auth-assoc-deauth.txt
Documentation/atomic_bitops.txt
Documentation/admin-guide/devices.txt
Documentation/admin-guide/kernel-parameters.txt
Documentation/target/target-export-device
Documentation/atomic_t.txt
Documentation/usb/CREDITS
Documentation/netlabel/draft-ietf-cipso-ipsecurity-01.txt
Documentation/virt/kvm/devices/README
Documentation/sparc/oradax/dax-hv-api.txt

Several of the above are false positives. For example, the IETF
draft should probably be kept as-is (or removed in favor of a
pointer to its URL inside the IETF site).

 Documentation/ABI/stable/sysfs-devices-node        |    2 +-
 Documentation/ABI/testing/procfs-smaps_rollup      |    2 +-
 .../{DMA-API-HOWTO.txt => DMA-API-HOWTO.rst}       |    0
 Documentation/{DMA-API.txt => DMA-API.rst}         |    6 +-
 Documentation/{DMA-ISA-LPC.txt => DMA-ISA-LPC.rst} |    2 +-
 .../{DMA-attributes.txt => DMA-attributes.rst}     |    0
 Documentation/{IPMI.txt => IPMI.rst}               |    0
 .../{IRQ-affinity.txt => IRQ-affinity.rst}         |    0
 Documentation/{IRQ-domain.txt => IRQ-domain.rst}   |    0
 Documentation/{IRQ.txt => IRQ.rst}                 |    0
 .../binding/{pci-test.txt => pci-test.rst}         |   33 +-
 Documentation/PCI/endpoint/index.rst               |    2 +
 Documentation/PCI/pci.rst                          |    8 +-
 Documentation/RCU/{RTFP.txt => RTFP.bib}           |  323 +--
 Documentation/RCU/RTFP.rst                         |  593 ++++++
 Documentation/RCU/{checklist.txt => checklist.rst} |   17 +-
 Documentation/RCU/index.rst                        |   11 +
 .../RCU/{lockdep-splat.txt => lockdep-splat.rst}   |  109 +-
 Documentation/RCU/{lockdep.txt => lockdep.rst}     |   12 +-
 Documentation/RCU/rcu.rst                          |    4 +-
 .../RCU/{rculist_nulls.txt => rculist_nulls.rst}   |  252 ++-
 Documentation/RCU/{rcuref.txt => rcuref.rst}       |  199 +-
 Documentation/RCU/{stallwarn.txt => stallwarn.rst} |   55 +-
 Documentation/RCU/{torture.txt => torture.rst}     |  117 +-
 Documentation/admin-guide/cpu-load.rst             |    2 +-
 Documentation/admin-guide/ext4.rst                 |    2 +-
 Documentation/admin-guide/hw-vuln/l1tf.rst         |    2 +-
 Documentation/admin-guide/kernel-parameters.txt    |   30 +-
 .../admin-guide/kernel-per-CPU-kthreads.rst        |    2 +-
 Documentation/admin-guide/nfs/nfsroot.rst          |    2 +-
 Documentation/admin-guide/serial-console.rst       |    2 +-
 Documentation/admin-guide/sysctl/kernel.rst        |    4 +-
 Documentation/admin-guide/sysctl/net.rst           |    4 +-
 Documentation/admin-guide/sysctl/vm.rst            |    2 +-
 Documentation/arm/booting.rst                      |    2 +-
 Documentation/arm/microchip.rst                    |    2 +-
 Documentation/arm64/index.rst                      |    1 +
 Documentation/arm64/{perf.txt => perf.rst}         |    7 +-
 Documentation/block/biodoc.rst                     |    2 +-
 Documentation/bpf/index.rst                        |    4 +-
 ...-phys-mapping.txt => bus-virt-phys-mapping.rst} |    2 +-
 .../{amd-powernow.txt => amd-powernow.rst}         |   12 +-
 Documentation/cpu-freq/{core.txt => core.rst}      |   65 +-
 .../cpu-freq/{cpu-drivers.txt => cpu-drivers.rst}  |  129 +-
 .../{cpufreq-nforce2.txt => cpufreq-nforce2.rst}   |   18 +-
 .../{cpufreq-stats.txt => cpufreq-stats.rst}       |  119 +-
 Documentation/cpu-freq/{index.txt => index.rst}    |   44 +-
 .../cpu-freq/{pcc-cpufreq.txt => pcc-cpufreq.rst}  |   92 +-
 Documentation/{crc32.txt => crc32.rst}             |    0
 .../crypto/{api-intro.txt => api-intro.rst}        |  186 +-
 .../{asymmetric-keys.txt => asymmetric-keys.rst}   |   91 +-
 .../crypto/{async-tx-api.txt => async-tx-api.rst}  |  255 ++-
 .../{descore-readme.txt => descore-readme.rst}     |  152 +-
 Documentation/crypto/index.rst                     |    5 +
 ...via-ohci1394.txt => debugging-via-ohci1394.rst} |    0
 .../devicetree/bindings/{ABI.txt => ABI.rst}       |    5 +-
 Documentation/devicetree/bindings/arm/amlogic.yaml |    2 +-
 Documentation/devicetree/bindings/arm/arm,scmi.txt |    2 +-
 Documentation/devicetree/bindings/arm/arm,scpi.txt |    2 +-
 .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt  |    2 +-
 .../bindings/arm/hisilicon/hi3519-sysctrl.txt      |    2 +-
 .../bindings/arm/msm/qcom,idle-state.txt           |    2 +-
 Documentation/devicetree/bindings/arm/omap/mpu.txt |    2 +-
 Documentation/devicetree/bindings/arm/psci.yaml    |    2 +-
 Documentation/devicetree/bindings/arm/syna.txt     |    2 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |    2 +-
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |    2 +-
 Documentation/devicetree/bindings/index.rst        |   12 +
 Documentation/devicetree/bindings/leds/common.yaml |    2 +-
 .../devicetree/bindings/leds/register-bit-led.txt  |    2 +-
 .../bindings/memory-controllers/ti/emif.txt        |    2 +-
 .../devicetree/bindings/misc/fsl,qoriq-mc.txt      |    2 +-
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |    2 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |    2 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |    2 +-
 .../bindings/power/amlogic,meson-ee-pwrc.yaml      |    2 +-
 .../devicetree/bindings/reset/st,stm32mp1-rcc.txt  |    2 +-
 ...bmitting-patches.txt => submitting-patches.rst} |   12 +-
 .../bindings/thermal/brcm,avs-ro-thermal.yaml      |    2 +-
 .../{writing-bindings.txt => writing-bindings.rst} |    9 +-
 ...oting-without-of.txt => booting-without-of.rst} |  303 +--
 .../devicetree/{changesets.txt => changesets.rst}  |   24 +-
 ...tion-notes.txt => dynamic-resolution-notes.rst} |    5 +-
 Documentation/devicetree/index.rst                 |   18 +
 .../{of_unittest.txt => of_unittest.rst}           |  192 +-
 .../{overlay-notes.txt => overlay-notes.rst}       |  143 +-
 .../{usage-model.txt => usage-model.rst}           |   35 +-
 Documentation/devicetree/writing-schema.rst        |    9 +-
 Documentation/{digsig.txt => digsig.rst}           |    0
 Documentation/doc-guide/maintainer-profile.rst     |    2 +-
 Documentation/driver-api/dmaengine/client.rst      |    2 +-
 Documentation/driver-api/dmaengine/provider.rst    |    2 +-
 Documentation/driver-api/driver-model/device.rst   |    4 +-
 Documentation/driver-api/driver-model/overview.rst |    2 +-
 Documentation/driver-api/libata.rst                |    2 +-
 .../driver-api/thermal/cpu-idle-cooling.rst        |   18 +-
 Documentation/driver-api/thermal/index.rst         |    1 +
 Documentation/driver-api/usb/dma.rst               |    6 +-
 Documentation/filesystems/{9p.txt => 9p.rst}       |  114 +-
 Documentation/filesystems/{adfs.txt => adfs.rst}   |   29 +-
 Documentation/filesystems/{affs.txt => affs.rst}   |   62 +-
 Documentation/filesystems/{afs.txt => afs.rst}     |   75 +-
 ...-mount-control.txt => autofs-mount-control.rst} |  108 +-
 ...automount-support.txt => automount-support.rst} |   23 +-
 Documentation/filesystems/{befs.txt => befs.rst}   |   59 +-
 Documentation/filesystems/{bfs.txt => bfs.rst}     |   37 +-
 Documentation/filesystems/{btrfs.txt => btrfs.rst} |    3 +
 .../caching/{backend-api.txt => backend-api.rst}   |  165 +-
 .../caching/{cachefiles.txt => cachefiles.rst}     |  139 +-
 .../caching/{fscache.txt => fscache.rst}           |  439 ++--
 Documentation/filesystems/caching/index.rst        |   14 +
 .../caching/{netfs-api.txt => netfs-api.rst}       |  172 +-
 .../filesystems/caching/{object.txt => object.rst} |   43 +-
 .../caching/{operations.txt => operations.rst}     |   45 +-
 Documentation/filesystems/{ceph.txt => ceph.rst}   |   26 +-
 .../cifs/{cifsroot.txt => cifsroot.rst}            |   58 +-
 Documentation/filesystems/{coda.txt => coda.rst}   | 1556 +++++++-------
 .../{configfs/configfs.txt => configfs.rst}        |  129 +-
 .../filesystems/{cramfs.txt => cramfs.rst}         |   19 +-
 Documentation/filesystems/{dax.txt => dax.rst}     |   11 +-
 .../filesystems/{debugfs.txt => debugfs.rst}       |   54 +-
 .../filesystems/{devpts.txt => devpts.rst}         |   40 +-
 Documentation/filesystems/{dlmfs.txt => dlmfs.rst} |   28 +-
 .../filesystems/{dnotify.txt => dnotify.rst}       |   13 +-
 .../filesystems/{ecryptfs.txt => ecryptfs.rst}     |   44 +-
 .../filesystems/{efivarfs.txt => efivarfs.rst}     |    5 +-
 Documentation/filesystems/{erofs.txt => erofs.rst} |  177 +-
 Documentation/filesystems/{ext2.txt => ext2.rst}   |   43 +-
 Documentation/filesystems/{ext3.txt => ext3.rst}   |    2 +
 Documentation/filesystems/{f2fs.txt => f2fs.rst}   |  254 ++-
 .../filesystems/{fiemap.txt => fiemap.rst}         |  131 +-
 Documentation/filesystems/{files.txt => files.rst} |   15 +-
 .../filesystems/{fuse-io.txt => fuse-io.rst}       |    6 +
 .../{gfs2-glocks.txt => gfs2-glocks.rst}           |  149 +-
 .../{gfs2-uevents.txt => gfs2-uevents.rst}         |   20 +-
 Documentation/filesystems/{gfs2.txt => gfs2.rst}   |   20 +-
 Documentation/filesystems/{hfs.txt => hfs.rst}     |   23 +-
 .../filesystems/{hfsplus.txt => hfsplus.rst}       |    2 +
 Documentation/filesystems/{hpfs.txt => hpfs.rst}   |  239 ++-
 Documentation/filesystems/index.rst                |   72 +-
 .../filesystems/{inotify.txt => inotify.rst}       |   33 +-
 Documentation/filesystems/{isofs.txt => isofs.rst} |   72 +-
 Documentation/filesystems/{locks.txt => locks.rst} |   14 +-
 ...mandatory-locking.txt => mandatory-locking.rst} |   25 +-
 .../filesystems/{mount_api.txt => mount_api.rst}   |  329 ++-
 .../filesystems/{nilfs2.txt => nilfs2.rst}         |   40 +-
 Documentation/filesystems/{ntfs.txt => ntfs.rst}   |  145 +-
 ...ne-filecheck.txt => ocfs2-online-filecheck.rst} |   45 +-
 Documentation/filesystems/{ocfs2.txt => ocfs2.rst} |   31 +-
 Documentation/filesystems/{omfs.txt => omfs.rst}   |   98 +-
 .../filesystems/{orangefs.txt => orangefs.rst}     |  187 +-
 .../{path-lookup.txt => path-walking.rst}          |   90 +-
 Documentation/filesystems/porting.rst              |    2 +-
 Documentation/filesystems/{proc.txt => proc.rst}   | 1546 +++++++-------
 Documentation/filesystems/{qnx6.txt => qnx6.rst}   |   22 +
 Documentation/filesystems/{quota.txt => quota.rst} |   41 +-
 ...fs-initramfs.txt => ramfs-rootfs-initramfs.rst} |   56 +-
 Documentation/filesystems/{relay.txt => relay.rst} |  139 +-
 Documentation/filesystems/{romfs.txt => romfs.rst} |   42 +-
 .../filesystems/{seq_file.txt => seq_file.rst}     |   61 +-
 .../{sharedsubtree.txt => sharedsubtree.rst}       |  398 ++--
 Documentation/filesystems/spufs/index.rst          |   13 +
 Documentation/filesystems/spufs/spu_create.rst     |  131 ++
 Documentation/filesystems/spufs/spu_run.rst        |  138 ++
 .../filesystems/{spufs.txt => spufs/spufs.rst}     |  304 +--
 .../filesystems/{squashfs.txt => squashfs.rst}     |   60 +-
 .../filesystems/{sysfs-pci.txt => sysfs-pci.rst}   |   23 +-
 .../{sysfs-tagging.txt => sysfs-tagging.rst}       |   22 +-
 Documentation/filesystems/{sysfs.txt => sysfs.rst} |  326 +--
 .../filesystems/{sysv-fs.txt => sysv-fs.rst}       |  153 +-
 Documentation/filesystems/{tmpfs.txt => tmpfs.rst} |   44 +-
 Documentation/filesystems/ubifs-authentication.rst |   10 +-
 Documentation/filesystems/{ubifs.txt => ubifs.rst} |   25 +-
 Documentation/filesystems/{udf.txt => udf.rst}     |   21 +-
 ...g-design.txt => xfs-delayed-logging-design.rst} |   65 +-
 ...tadata.txt => xfs-self-describing-metadata.rst} |  190 +-
 .../filesystems/{zonefs.txt => zonefs.rst}         |  108 +-
 .../{futex-requeue-pi.txt => futex-requeue-pi.rst} |    0
 Documentation/gpu/drm-mm.rst                       |    2 +-
 Documentation/gpu/i915.rst                         |    4 +-
 Documentation/hwmon/adm1177.rst                    |    3 +-
 Documentation/{hwspinlock.txt => hwspinlock.rst}   |    0
 Documentation/ia64/irq-redir.rst                   |    2 +-
 Documentation/iio/iio_configfs.rst                 |    2 +-
 Documentation/index.rst                            |   52 +
 Documentation/{io-mapping.txt => io-mapping.rst}   |    0
 Documentation/{io_ordering.txt => io_ordering.rst} |    0
 .../{irqflags-tracing.txt => irqflags-tracing.rst} |    0
 Documentation/{kobject.txt => kobject.rst}         |    2 +-
 Documentation/{kprobes.txt => kprobes.rst}         |    0
 Documentation/{kref.txt => kref.rst}               |    0
 Documentation/locking/locktorture.rst              |    2 +-
 Documentation/locking/rt-mutex.rst                 |    2 +-
 Documentation/{lzo.txt => lzo.rst}                 |    0
 Documentation/{mailbox.txt => mailbox.rst}         |    0
 Documentation/memory-barriers.txt                  |    8 +-
 .../{ad525x_dpot.txt => ad525x_dpot.rst}           |   24 +-
 .../misc-devices/{apds990x.txt => apds990x.rst}    |   31 +-
 .../misc-devices/{bh1770glc.txt => bh1770glc.rst}  |   45 +-
 .../misc-devices/{c2port.txt => c2port.rst}        |   58 +-
 Documentation/misc-devices/index.rst               |    6 +
 ...pci-endpoint-test.txt => pci-endpoint-test.rst} |   65 +-
 ...spear-pcie-gadget.txt => spear-pcie-gadget.rst} |  176 +-
 .../networking/{6lowpan.txt => 6lowpan.rst}        |   29 +-
 Documentation/networking/{6pack.txt => 6pack.rst}  |   46 +-
 .../networking/{altera_tse.txt => altera_tse.rst}  |   89 +-
 .../{arcnet-hardware.txt => arcnet-hardware.rst}   | 2227 ++++++++++----------
 .../networking/{arcnet.txt => arcnet.rst}          |  348 +--
 Documentation/networking/{atm.txt => atm.rst}      |    6 +
 Documentation/networking/{ax25.txt => ax25.rst}    |    6 +
 .../networking/{baycom.txt => baycom.rst}          |  120 +-
 .../networking/{bonding.txt => bonding.rst}        | 1317 ++++++------
 Documentation/networking/caif/caif.rst             |    2 -
 Documentation/networking/caif/index.rst            |   13 +
 .../caif/{Linux-CAIF.txt => linux_caif.rst}        |   54 +-
 .../caif/{spi_porting.txt => spi_porting.rst}      |  291 +--
 Documentation/networking/can.rst                   |    2 +-
 .../networking/{cdc_mbim.txt => cdc_mbim.rst}      |   76 +-
 Documentation/networking/checksum-offloads.rst     |    2 +-
 Documentation/networking/{cops.txt => cops.rst}    |   77 +-
 .../networking/{cxacru.txt => cxacru.rst}          |   86 +-
 Documentation/networking/{dccp.txt => dccp.rst}    |   39 +-
 Documentation/networking/{dctcp.txt => dctcp.rst}  |   14 +-
 .../networking/{decnet.txt => decnet.rst}          |   77 +-
 Documentation/networking/{defza.txt => defza.rst}  |    8 +-
 .../device_drivers/3com/{3c509.txt => 3c509.rst}   |  162 +-
 .../device_drivers/3com/{vortex.txt => vortex.rst} |  227 +-
 .../device_drivers/amazon/{ena.txt => ena.rst}     |  144 +-
 .../aquantia/{atlantic.txt => atlantic.rst}        |  369 ++--
 .../device_drivers/chelsio/{cxgb.txt => cxgb.rst}  |  183 +-
 .../cirrus/{cs89x0.txt => cs89x0.rst}              |  559 ++---
 .../davicom/{dm9000.txt => dm9000.rst}             |   24 +-
 .../device_drivers/dec/{de4x5.txt => de4x5.rst}    |  105 +-
 .../device_drivers/dec/{dmfe.txt => dmfe.rst}      |   35 +-
 .../device_drivers/dlink/{dl2k.txt => dl2k.rst}    |  228 +-
 .../freescale/{dpaa.txt => dpaa.rst}               |  141 +-
 .../freescale/{gianfar.txt => gianfar.rst}         |   21 +-
 Documentation/networking/device_drivers/index.rst  |   24 +
 .../networking/device_drivers/intel/e100.rst       |    2 +-
 .../intel/{ipw2100.txt => ipw2100.rst}             |  240 ++-
 .../intel/{ipw2200.txt => ipw2200.rst}             |  414 ++--
 .../networking/device_drivers/intel/ixgb.rst       |    2 +-
 .../microsoft/{netvsc.txt => netvsc.rst}           |   57 +-
 .../device_drivers/neterion/{s2io.txt => s2io.rst} |  213 +-
 .../device_drivers/neterion/{vxge.txt => vxge.rst} |   60 +-
 .../qualcomm/{rmnet.txt => rmnet.rst}              |   43 +-
 .../device_drivers/{sb1000.txt => sb1000.rst}      |  331 +--
 .../device_drivers/smsc/{smc9.txt => smc9.rst}     |   47 +-
 .../networking/device_drivers/ti/cpsw.rst          |  587 ++++++
 .../networking/device_drivers/ti/cpsw.txt          |  541 -----
 .../ti/{cpsw_switchdev.txt => cpsw_switchdev.rst}  |  243 ++-
 .../device_drivers/ti/{tlan.txt => tlan.rst}       |   73 +-
 .../toshiba/{spider_net.txt => spider_net.rst}     |   60 +-
 .../{dns_resolver.txt => dns_resolver.rst}         |   52 +-
 .../networking/{driver.txt => driver.rst}          |   22 +-
 Documentation/networking/{eql.txt => eql.rst}      |  443 ++--
 .../networking/{fib_trie.txt => fib_trie.rst}      |   16 +-
 .../networking/{filter.txt => filter.rst}          |  868 ++++----
 .../networking/{fore200e.txt => fore200e.rst}      |    8 +-
 .../networking/{framerelay.txt => framerelay.rst}  |   21 +-
 .../networking/{gen_stats.txt => gen_stats.rst}    |   98 +-
 .../{generic-hdlc.txt => generic-hdlc.rst}         |   86 +-
 .../{generic_netlink.txt => generic_netlink.rst}   |    6 +
 Documentation/networking/{gtp.txt => gtp.rst}      |   97 +-
 Documentation/networking/{hinic.txt => hinic.rst}  |    5 +-
 Documentation/networking/{ila.txt => ila.rst}      |   89 +-
 Documentation/networking/index.rst                 |   88 +
 .../networking/{ip-sysctl.txt => ip-sysctl.rst}    |  834 +++++---
 .../networking/{ip_dynaddr.txt => ip_dynaddr.rst}  |   29 +-
 Documentation/networking/{ipddp.txt => ipddp.rst}  |   13 +-
 .../networking/{iphase.txt => iphase.rst}          |  187 +-
 Documentation/networking/{ipsec.txt => ipsec.rst}  |   14 +-
 Documentation/networking/{ipv6.txt => ipv6.rst}    |    8 +-
 .../networking/{ipvlan.txt => ipvlan.rst}          |  159 +-
 .../{ipvs-sysctl.txt => ipvs-sysctl.rst}           |  188 +-
 Documentation/networking/{kcm.txt => kcm.rst}      |   85 +-
 Documentation/networking/{l2tp.txt => l2tp.rst}    |  159 +-
 .../{lapb-module.txt => lapb-module.rst}           |  122 +-
 Documentation/networking/{ltpc.txt => ltpc.rst}    |   47 +-
 ...c80211-injection.txt => mac80211-injection.rst} |   41 +-
 .../{mpls-sysctl.txt => mpls-sysctl.rst}           |   17 +-
 .../networking/{multiqueue.txt => multiqueue.rst}  |   41 +-
 .../networking/{net_dim.txt => net_dim.rst}        |  113 +-
 .../networking/{netconsole.txt => netconsole.rst}  |  125 +-
 .../{netdev-features.txt => netdev-features.rst}   |   19 +-
 .../networking/{netdevices.txt => netdevices.rst}  |   21 +-
 .../{netfilter-sysctl.txt => netfilter-sysctl.rst} |   11 +-
 .../networking/{netif-msg.txt => netif-msg.rst}    |   86 +-
 ...onntrack-sysctl.txt => nf_conntrack-sysctl.rst} |   51 +-
 .../{nf_flowtable.txt => nf_flowtable.rst}         |   55 +-
 .../{openvswitch.txt => openvswitch.rst}           |   23 +-
 .../networking/{operstates.txt => operstates.rst}  |   45 +-
 .../{packet_mmap.txt => packet_mmap.rst}           | 1255 +++++------
 .../networking/{phonet.txt => phonet.rst}          |   56 +-
 .../networking/{pktgen.txt => pktgen.rst}          |  320 +--
 Documentation/networking/{PLIP.txt => plip.rst}    |   43 +-
 .../{ppp_generic.txt => ppp_generic.rst}           |   52 +-
 .../{proc_net_tcp.txt => proc_net_tcp.rst}         |   23 +-
 .../{radiotap-headers.txt => radiotap-headers.rst} |   99 +-
 .../networking/{ray_cs.txt => ray_cs.rst}          |  105 +-
 Documentation/networking/{rds.txt => rds.rst}      |  305 +--
 .../networking/{regulatory.txt => regulatory.rst}  |   29 +-
 Documentation/networking/{rxrpc.txt => rxrpc.rst}  |  306 +--
 Documentation/networking/scaling.rst               |    4 +-
 Documentation/networking/{sctp.txt => sctp.rst}    |   37 +-
 Documentation/networking/{secid.txt => secid.rst}  |    6 +
 .../{seg6-sysctl.txt => seg6-sysctl.rst}           |   18 +-
 Documentation/networking/{skfp.txt => skfp.rst}    |  153 +-
 Documentation/networking/snmp_counter.rst          |    2 +-
 .../networking/{strparser.txt => strparser.rst}    |   85 +-
 .../networking/{switchdev.txt => switchdev.rst}    |  116 +-
 ...ions-env-rules.txt => tc-actions-env-rules.rst} |   25 +-
 .../networking/{tcp-thin.txt => tcp-thin.rst}      |    5 +
 Documentation/networking/{team.txt => team.rst}    |    6 +
 .../{timestamping.txt => timestamping.rst}         |  166 +-
 .../networking/{tproxy.txt => tproxy.rst}          |   57 +-
 .../networking/{tuntap.txt => tuntap.rst}          |  200 +-
 .../networking/{udplite.txt => udplite.rst}        |  175 +-
 Documentation/networking/{vrf.txt => vrf.rst}      |  497 +++--
 Documentation/networking/{vxlan.txt => vxlan.rst}  |   33 +-
 .../networking/{x25-iface.txt => x25-iface.rst}    |   10 +-
 Documentation/networking/{x25.txt => x25.rst}      |    4 +
 .../{xfrm_device.txt => xfrm_device.rst}           |   33 +-
 .../networking/{xfrm_proc.txt => xfrm_proc.rst}    |   31 +
 .../networking/{xfrm_sync.txt => xfrm_sync.rst}    |   66 +-
 .../{xfrm_sysctl.txt => xfrm_sysctl.rst}           |    7 +
 .../networking/{z8530drv.txt => z8530drv.rst}      |  629 +++---
 Documentation/{nommu-mmap.txt => nommu-mmap.rst}   |    0
 ...pu-rw-semaphore.txt => percpu-rw-semaphore.rst} |    0
 Documentation/{pi-futex.txt => pi-futex.rst}       |    0
 Documentation/powerpc/firmware-assisted-dump.rst   |    2 +-
 Documentation/powerpc/index.rst                    |    1 +
 ...pudispatch_stats.txt => vcpudispatch_stats.rst} |   17 +-
 .../{preempt-locking.txt => preempt-locking.rst}   |    0
 Documentation/process/adding-syscalls.rst          |    2 +-
 Documentation/process/submit-checklist.rst         |    2 +-
 Documentation/process/submitting-patches.rst       |    2 +-
 Documentation/{rbtree.txt => rbtree.rst}           |    0
 Documentation/{remoteproc.txt => remoteproc.rst}   |    2 +-
 .../{robust-futex-ABI.txt => robust-futex-ABI.rst} |    0
 .../{robust-futexes.txt => robust-futexes.rst}     |    0
 Documentation/{rpmsg.txt => rpmsg.rst}             |    0
 Documentation/scsi/{53c700.txt => 53c700.rst}      |   61 +-
 Documentation/scsi/{BusLogic.txt => BusLogic.rst}  |   89 +-
 .../scsi/{FlashPoint.txt => FlashPoint.rst}        |  241 ++-
 .../scsi/{NinjaSCSI.txt => NinjaSCSI.rst}          |  198 +-
 Documentation/scsi/{aacraid.txt => aacraid.rst}    |   59 +-
 Documentation/scsi/{advansys.txt => advansys.rst}  |  129 +-
 Documentation/scsi/{aha152x.txt => aha152x.rst}    |   73 +-
 Documentation/scsi/{aic79xx.txt => aic79xx.rst}    |  586 ++---
 Documentation/scsi/{aic7xxx.txt => aic7xxx.rst}    |  446 ++--
 Documentation/scsi/arcmsr_spec.rst                 |  907 ++++++++
 Documentation/scsi/arcmsr_spec.txt                 |  574 -----
 Documentation/scsi/{bfa.txt => bfa.rst}            |   28 +-
 Documentation/scsi/{bnx2fc.txt => bnx2fc.rst}      |   18 +-
 Documentation/scsi/{cxgb3i.txt => cxgb3i.rst}      |   22 +-
 Documentation/scsi/{dc395x.txt => dc395x.rst}      |   79 +-
 Documentation/scsi/dpti.rst                        |   92 +
 Documentation/scsi/dpti.txt                        |   83 -
 .../scsi/{g_NCR5380.txt => g_NCR5380.rst}          |   83 +-
 Documentation/scsi/{hpsa.txt => hpsa.rst}          |   79 +-
 Documentation/scsi/{hptiop.txt => hptiop.rst}      |   45 +-
 Documentation/scsi/index.rst                       |   51 +
 Documentation/scsi/{libsas.txt => libsas.rst}      |  352 ++--
 ...policy.txt => link_power_management_policy.rst} |   12 +-
 Documentation/scsi/{lpfc.txt => lpfc.rst}          |   16 +-
 Documentation/scsi/{megaraid.txt => megaraid.rst}  |   47 +-
 .../scsi/{ncr53c8xx.txt => ncr53c8xx.rst}          | 1871 +++++++++-------
 Documentation/scsi/{ppa.txt => ppa.rst}            |   12 +-
 .../scsi/{qlogicfas.txt => qlogicfas.rst}          |   17 +-
 .../scsi/{scsi-changer.txt => scsi-changer.rst}    |   36 +-
 .../scsi/{scsi-generic.txt => scsi-generic.rst}    |   75 +-
 .../{scsi-parameters.txt => scsi-parameters.rst}   |   28 +-
 Documentation/scsi/{scsi.txt => scsi.rst}          |   31 +-
 Documentation/scsi/{scsi_eh.txt => scsi_eh.rst}    |  213 +-
 ...scsi_fc_transport.txt => scsi_fc_transport.rst} |  242 ++-
 .../{scsi_mid_low_api.txt => scsi_mid_low_api.rst} | 1788 ++++++++--------
 Documentation/scsi/scsi_transport_srp/Makefile     |    7 -
 Documentation/scsi/scsi_transport_srp/figures.rst  |    6 +
 .../scsi/{sd-parameters.txt => sd-parameters.rst}  |   21 +-
 Documentation/scsi/{smartpqi.txt => smartpqi.rst}  |   52 +-
 Documentation/scsi/{st.txt => st.rst}              |  301 ++-
 .../scsi/{sym53c500_cs.txt => sym53c500_cs.rst}    |    8 +-
 .../scsi/{sym53c8xx_2.txt => sym53c8xx_2.rst}      | 1131 +++++-----
 .../scsi/{tcm_qla2xxx.txt => tcm_qla2xxx.rst}      |   26 +-
 Documentation/scsi/{ufs.txt => ufs.rst}            |   84 +-
 Documentation/scsi/{wd719x.txt => wd719x.rst}      |   23 +-
 Documentation/security/keys/core.rst               |    2 +-
 Documentation/sh/index.rst                         |    6 +
 .../sh/{new-machine.txt => new-machine.rst}        |  199 +-
 .../sh/{register-banks.txt => register-banks.rst}  |   13 +-
 Documentation/{speculation.txt => speculation.rst} |    0
 Documentation/{static-keys.txt => static-keys.rst} |    0
 Documentation/{tee.txt => tee.rst}                 |    0
 .../{this_cpu_ops.txt => this_cpu_ops.rst}         |    0
 Documentation/trace/index.rst                      |    1 +
 Documentation/trace/kprobetrace.rst                |    2 +-
 ...ng-buffer-design.txt => ring-buffer-design.rst} |  836 ++++----
 .../translations/it_IT/process/adding-syscalls.rst |    2 +-
 .../it_IT/process/submit-checklist.rst             |    2 +-
 .../it_IT/process/submitting-patches.rst           |    2 +-
 .../translations/ko_KR/memory-barriers.txt         |    8 +-
 Documentation/translations/zh_CN/IRQ.txt           |    4 +-
 Documentation/translations/zh_CN/arm/Booting       |    2 +-
 .../translations/zh_CN/filesystems/sysfs.txt       |    8 +-
 Documentation/translations/zh_CN/io_ordering.txt   |    4 +-
 .../zh_CN/process/submit-checklist.rst             |    2 +-
 ...mory-access.txt => unaligned-memory-access.rst} |    0
 Documentation/usb/gadget_configfs.rst              |    4 +-
 Documentation/virt/kvm/arm/pvtime.rst              |    2 +-
 Documentation/virt/kvm/devices/vcpu.rst            |    2 +-
 Documentation/virt/kvm/hypercalls.rst              |    4 +-
 Documentation/virt/kvm/mmu.rst                     |    2 +-
 Documentation/virt/kvm/review-checklist.rst        |    2 +-
 Documentation/watchdog/hpwdt.rst                   |    2 +-
 Documentation/x86/index.rst                        |    1 -
 Documentation/{xz.txt => xz.rst}                   |    0
 MAINTAINERS                                        |  188 +-
 Next/merge.log                                     |    2 +-
 arch/Kconfig                                       |    2 +-
 arch/ia64/hp/common/sba_iommu.c                    |   12 +-
 arch/parisc/kernel/pci-dma.c                       |    2 +-
 arch/powerpc/include/uapi/asm/kvm_para.h           |    2 +-
 arch/sh/Kconfig.cpu                                |    2 +-
 arch/unicore32/include/asm/io.h                    |    2 +-
 arch/x86/include/asm/dma-mapping.h                 |    4 +-
 arch/x86/kernel/amd_gart_64.c                      |    2 +-
 arch/x86/kvm/mmu/mmu.c                             |    2 +-
 crypto/asymmetric_keys/asymmetric_type.c           |    2 +-
 crypto/asymmetric_keys/public_key.c                |    2 +-
 crypto/asymmetric_keys/signature.c                 |    2 +-
 drivers/atm/Kconfig                                |    4 +-
 drivers/base/core.c                                |    2 +-
 drivers/char/ipmi/Kconfig                          |    2 +-
 drivers/char/ipmi/ipmi_si_hotmod.c                 |    2 +-
 drivers/char/ipmi/ipmi_si_intf.c                   |    2 +-
 drivers/cpufreq/Kconfig.x86                        |    2 +-
 .../crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c    |    2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c  |    2 +-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c    |    2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c  |    2 +-
 drivers/gpu/drm/Kconfig                            |    2 +-
 drivers/gpu/drm/drm_ioctl.c                        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 +-
 drivers/hwtracing/coresight/Kconfig                |    2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    2 +-
 drivers/misc/Kconfig                               |    2 +-
 drivers/misc/ad525x_dpot.c                         |    2 +-
 drivers/net/Kconfig                                |   12 +-
 drivers/net/appletalk/Kconfig                      |    8 +-
 drivers/net/arcnet/Kconfig                         |    6 +-
 drivers/net/caif/Kconfig                           |    2 +-
 drivers/net/ethernet/3com/3c59x.c                  |    4 +-
 drivers/net/ethernet/3com/Kconfig                  |    2 +-
 drivers/net/ethernet/chelsio/Kconfig               |    2 +-
 drivers/net/ethernet/cirrus/Kconfig                |    2 +-
 drivers/net/ethernet/dec/tulip/Kconfig             |    4 +-
 drivers/net/ethernet/dlink/dl2k.c                  |    2 +-
 drivers/net/ethernet/neterion/Kconfig              |    4 +-
 drivers/net/ethernet/smsc/Kconfig                  |    4 +-
 drivers/net/ethernet/ti/Kconfig                    |    2 +-
 drivers/net/ethernet/ti/tlan.c                     |    2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c       |    2 +-
 drivers/net/ethernet/toshiba/spider_net.c          |    2 +-
 drivers/net/fddi/Kconfig                           |    2 +-
 drivers/net/hamradio/Kconfig                       |   14 +-
 drivers/net/hamradio/scc.c                         |    2 +-
 drivers/net/plip/Kconfig                           |    2 +-
 drivers/net/wan/Kconfig                            |    4 +-
 drivers/net/wireless/Kconfig                       |    2 +-
 drivers/net/wireless/intel/ipw2x00/Kconfig         |    4 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c       |    2 +-
 drivers/parisc/sba_iommu.c                         |   14 +-
 drivers/scsi/BusLogic.c                            |    2 +-
 drivers/scsi/Kconfig                               |   42 +-
 drivers/scsi/aha152x.c                             |    4 +-
 drivers/scsi/aic7xxx/Kconfig.aic79xx               |    2 +-
 drivers/scsi/aic7xxx/Kconfig.aic7xxx               |    2 +-
 drivers/scsi/arcmsr/arcmsr_attr.c                  |    2 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   |    2 +-
 drivers/scsi/dpt/dpti_ioctl.h                      |    2 +-
 drivers/scsi/dpt_i2o.c                             |    2 +-
 drivers/scsi/dpti.h                                |    2 +-
 drivers/scsi/g_NCR5380.c                           |    2 +-
 drivers/scsi/ncr53c8xx.c                           |    2 +-
 drivers/scsi/pcmcia/Kconfig                        |    2 +-
 drivers/scsi/smartpqi/Kconfig                      |    2 +-
 drivers/scsi/st.c                                  |    2 +-
 drivers/scsi/ufs/Kconfig                           |    2 +-
 drivers/staging/fsl-dpaa2/ethsw/README             |    2 +-
 fs/Kconfig                                         |    2 +-
 fs/Kconfig.binfmt                                  |    2 +-
 fs/adfs/Kconfig                                    |    2 +-
 fs/affs/Kconfig                                    |    2 +-
 fs/afs/Kconfig                                     |    6 +-
 fs/bfs/Kconfig                                     |    2 +-
 fs/cachefiles/Kconfig                              |    4 +-
 fs/coda/Kconfig                                    |    2 +-
 fs/configfs/inode.c                                |    2 +-
 fs/configfs/item.c                                 |    2 +-
 fs/cramfs/Kconfig                                  |    2 +-
 fs/dcache.c                                        |    6 +-
 fs/ecryptfs/Kconfig                                |    2 +-
 fs/fat/Kconfig                                     |    8 +-
 fs/fscache/Kconfig                                 |    8 +-
 fs/fscache/cache.c                                 |    8 +-
 fs/fscache/cookie.c                                |    2 +-
 fs/fscache/object.c                                |    4 +-
 fs/fscache/operation.c                             |    2 +-
 fs/fuse/Kconfig                                    |    2 +-
 fs/fuse/dev.c                                      |    2 +-
 fs/hfs/Kconfig                                     |    2 +-
 fs/hpfs/Kconfig                                    |    2 +-
 fs/isofs/Kconfig                                   |    2 +-
 fs/locks.c                                         |    2 +-
 fs/namei.c                                         |    2 +-
 fs/namespace.c                                     |    2 +-
 fs/nfs/Kconfig                                     |    2 +-
 fs/notify/inotify/Kconfig                          |    2 +-
 fs/ntfs/Kconfig                                    |    2 +-
 fs/ocfs2/Kconfig                                   |    2 +-
 fs/overlayfs/Kconfig                               |    6 +-
 fs/proc/Kconfig                                    |    4 +-
 fs/romfs/Kconfig                                   |    2 +-
 fs/sysfs/dir.c                                     |    2 +-
 fs/sysfs/file.c                                    |    2 +-
 fs/sysfs/mount.c                                   |    2 +-
 fs/sysfs/symlink.c                                 |    2 +-
 fs/sysv/Kconfig                                    |    2 +-
 fs/udf/Kconfig                                     |    2 +-
 include/crypto/public_key.h                        |    2 +-
 include/keys/asymmetric-parser.h                   |    2 +-
 include/keys/asymmetric-subtype.h                  |    2 +-
 include/keys/asymmetric-type.h                     |    2 +-
 include/linux/configfs.h                           |    2 +-
 include/linux/dma-mapping.h                        |    2 +-
 include/linux/fs_context.h                         |    2 +-
 include/linux/fscache-cache.h                      |    4 +-
 include/linux/fscache.h                            |   42 +-
 include/linux/io-mapping.h                         |    2 +-
 include/linux/jump_label.h                         |    2 +-
 include/linux/kobject.h                            |    2 +-
 include/linux/kobject_ns.h                         |    2 +-
 include/linux/lsm_hooks.h                          |    2 +-
 include/linux/mfd/core.h                           |    2 +-
 include/linux/mm.h                                 |    4 +-
 include/linux/netdev_features.h                    |    2 +-
 include/linux/rbtree.h                             |    2 +-
 include/linux/rbtree_augmented.h                   |    2 +-
 include/linux/rculist_nulls.h                      |    2 +-
 include/linux/relay.h                              |    2 +-
 include/linux/sysfs.h                              |    2 +-
 include/media/videobuf-dma-sg.h                    |    2 +-
 include/net/cfg80211.h                             |    2 +-
 include/scsi/sg.h                                  |    2 +-
 include/uapi/linux/errqueue.h                      |    2 +-
 include/uapi/linux/ethtool_netlink.h               |    2 +-
 include/uapi/linux/if_x25.h                        |    2 +-
 include/uapi/linux/kvm.h                           |    4 +-
 include/uapi/rdma/rdma_user_ioctl_cmds.h           |    2 +-
 init/Kconfig                                       |    2 +-
 kernel/dma/debug.c                                 |    2 +-
 kernel/rcu/rcutorture.c                            |    2 +-
 kernel/rcu/tree_stall.h                            |    4 +-
 kernel/relay.c                                     |    2 +-
 lib/Kconfig                                        |    2 +-
 lib/Kconfig.debug                                  |    2 +-
 lib/crc32.c                                        |    2 +-
 lib/kobject.c                                      |    4 +-
 lib/lzo/lzo1x_decompress_safe.c                    |    2 +-
 lib/xz/Kconfig                                     |    2 +-
 mm/Kconfig                                         |    2 +-
 mm/gup.c                                           |   12 +-
 mm/nommu.c                                         |    2 +-
 net/Kconfig                                        |    4 +-
 net/atm/Kconfig                                    |    2 +-
 net/ax25/Kconfig                                   |    6 +-
 net/ceph/Kconfig                                   |    2 +-
 net/core/gen_stats.c                               |    2 +-
 net/core/pktgen.c                                  |    2 +-
 net/core/sock.c                                    |    4 +-
 net/decnet/Kconfig                                 |    4 +-
 net/dns_resolver/Kconfig                           |    2 +-
 net/dns_resolver/dns_key.c                         |    2 +-
 net/dns_resolver/dns_query.c                       |    2 +-
 net/ipv4/Kconfig                                   |    8 +-
 net/ipv4/icmp.c                                    |    2 +-
 net/ipv4/ipconfig.c                                |    2 +-
 net/ipv6/Kconfig                                   |    2 +-
 net/lapb/Kconfig                                   |    2 +-
 net/mac80211/tx.c                                  |    2 +-
 net/netfilter/Kconfig                              |    2 +-
 net/rxrpc/Kconfig                                  |    6 +-
 net/rxrpc/sysctl.c                                 |    2 +-
 net/wireless/radiotap.c                            |    2 +-
 net/x25/Kconfig                                    |    4 +-
 samples/kprobes/kprobe_example.c                   |    2 +-
 samples/kprobes/kretprobe_example.c                |    2 +-
 samples/pktgen/README.rst                          |    2 +-
 scripts/checkpatch.pl                              |    2 +-
 scripts/documentation-file-ref-check               |   13 +-
 tools/bpf/bpf_asm.c                                |    2 +-
 tools/bpf/bpf_dbg.c                                |    2 +-
 tools/include/linux/rbtree.h                       |    2 +-
 tools/include/linux/rbtree_augmented.h             |    2 +-
 tools/include/uapi/linux/kvm.h                     |    4 +-
 virt/kvm/arm/vgic/vgic-mmio-v3.c                   |    2 +-
 virt/kvm/arm/vgic/vgic.h                           |    4 +-
 608 files changed, 25908 insertions(+), 19832 deletions(-)

