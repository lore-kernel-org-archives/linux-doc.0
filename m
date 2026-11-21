Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264947;
	b=w8jvL2/vT0BVm5L5ljOc5GhEowsU5917DPeTYPAMGgkHUzQ5M598cm7ZOmZfdbB053su
	 ven8OAYp/MLstpGKeTF6elnSfTpcJPUEUVHBdw/aEpchVi7R0DNbdl1o+U1bcyKUD5vH/
	 VwoebKDAYcy2b1zuGGFvtHKHRLA5vpJqAaa/XVMwr048eA6nFrkn+ocmCwkkWLNWrhePM
	 5RxBfRN286Hm7s4UsQ3F8wlju4OdmuNoapFhvtpGkNBCaxijRB+2zvz3m5+MbsOi/KSrU
	 2fiSmTC9weu3+rsy5v3Mx/keCwsXA9ac8s7fTdibz1fiZyBOrixpWmvCSCXoIcUtAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264947;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=B2/Og1vypeSBCVc9jeVdKyeKApwX92hxBK+MvswlFtY=;
	b=GVs3G5G9OrrlzOUtDixMT7cVhsSt2chit3yld2uCPafqlMI8YZK5fY/PoRIXJ2hQtje6
	 GVZhPl0OHZr6FSXxGvLisdm6GH9Ta9/qp0NMPM4ahq1QzosLvPnQZsMYlQoSWe14TChnt
	 +hg2Ee6oYdomsJgOhmsFu66FVDoW47jZt0w83wsHBc4XTc3PBUIwTP/kslL6FRq7LEDGt
	 5V86fEnYoUENf5mABBV6v9f1BN1eMKtYSRYk5LNJSEH3fdftJgD1c5bfaf4o/ii+qmzZ+
	 NhAjS1Q3xERZ1mGXruMkpxxdF4gc0WZbbwj6PKz9anMlbx5Ze9Y3La62/NJrK2BVdfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAz7spVA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6B606A320;
	Sat, 21 Nov 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAz7spVA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8975C1F000C4;
	Sat, 21 Nov 2026 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264946;
	bh=B2/Og1vypeSBCVc9jeVdKyeKApwX92hxBK+MvswlFtY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GAz7spVAlJE81+xSf+XW0qKODat2Co0f9qRxovKvZE2j5Say39TAbVdRJcO+KPKC8
	 uWH8S3lX5gJS+2/khXlXvTKUNorI/LjccslStLDHvoORqKfB/pIz3FTdPyh+TDY/Am
	 f1nJQaIRa+2E5de5GAS0FCy6B/ROxMmEJfP4RhdnlBTu4NgpWzAmGWr3GkFdQN1PNG
	 blx+YMkDaJGdp2riXtM1Dw07F2aED5aKmldUjm0xkHg51UVZ95p/UdhmCEJHQ4fOJ3
	 eUHxn+VrpXTtopf8GjJSU8VoTWbVsvefzmCHeNOg1FfAOdyv0O/WQUHo57hLDzzka5
	 dy8jWQhjAtMiQ==
Subject: Re: [PATCH net-next v12 1/6] net: wwan: t9xx: Add PCIe core
From: netdev-bot+sashiko@kernel.org
To: jackbb_wu@compal.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, wen-zhi.huang@mediatek.com,
 shi-wei.yeh@mediatek.com, Minano.tseng@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, robert_yu@compal.com, Jeff_Chang@compal.com,
 edumazet@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Sat, 21 Nov 2026 12:42:25 +0000
Message-ID: <179526494505.3135.4658538684680862441@kernel.org>
In-Reply-To: <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>
References: <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mtk_pci_remove() resets the modem itself after
  pci_save_state(), and mtk_pci_shutdown() reuses it on a kexec reboot.
- [Low] mtk_pci_probe() enables the device with pcim_enable_device(),
  which sets pdev->is_managed.

--

net: wwan: t9xx: Add PCIe core

This commit adds the PCIe core for the MediaTek T9xx 5G WWAN modem driver.
It covers probe/remove, MSI-X setup, the MHCCIF event channels and the
register accessors. On removal, and on shutdown during a kexec reboot, the
modem is reset through ACPI MRST._RST, falling back to the MHCCIF
DEV_EVT_H2D_DEVICE_RESET doorbell.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> new file mode 100644
> index 0000000000000..cf59038f09067
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -0,0 +1,1034 @@

[ ... ]

> +static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{

[ ... ]

> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(mdev->dev, "Failed to enable pci device.\n");
> +		goto log_err;
> +	}

[ ... ]

> +free_irq:
> +	mtk_pci_free_irq(mdev);
> +free_mhccif:
> +	mtk_mhccif_exit(mdev);
> +	pci_free_irq_vectors(pdev);

[Severity: Low]
Is it safe to call pci_free_irq_vectors() here and in mtk_pci_remove() when
the device was enabled with pcim_enable_device()?

pcim_enable_device() sets pdev->is_managed. Because of that,
pci_alloc_irq_vectors() in mtk_pci_request_irq() goes through
pci_setup_msi_context()->pcim_setup_msi_release(), which registers
pcim_msi_release() as a devres action.

The kernel-doc of pci_free_irq_vectors() in drivers/pci/msi/api.c says:

 * WARNING: Do not call this function if the device has been enabled
 * with pcim_enable_device(). In that case, IRQ vectors are automatically
 * managed via pcim_msi_release() and calling pci_free_irq_vectors() can
 * lead to double-free issues.

After a failed probe, or once mtk_pci_remove() returns, devres calls
pci_free_irq_vectors() a second time. Today that does nothing, because
pci_disable_msix() returns early when !dev->msix_enabled. The TODO in
drivers/pci/msi/msi.c says this implicit managed behaviour is going to
change, though, so the driver would then be relying on an idempotence that
may go away.

This is still the same at the end of the series.

> +	priv->irq_cnt = 0;
> +disable_atr:
> +	mtk_pci_atr_disable(priv);

[ ... ]

> +static void mtk_pci_remove(struct pci_dev *pdev)
> +{

[ ... ]

> +	mtk_pci_free_irq(mdev);
> +	mtk_mhccif_exit(mdev);
> +	pci_free_irq_vectors(pdev);
> +	priv->irq_cnt = 0;
> +	pci_clear_master(pdev);
> +	/* A dead link reads all-ones: keep the copy saved while it was up. */
> +	if (mtk_pci_link_check(mdev))
> +		pci_save_state(pdev);
> +
> +	/* Reset last: the endpoint comes back at power-on defaults, so no MMIO
> +	 * and no MSI-X teardown may follow it.
> +	 */
> +	ret = mtk_pci_pldr(mdev);

[Severity: Medium]
Could pciehp treat this reset as a surprise removal of the modem?

MRST._RST in mtk_pci_pldr() is a platform reset that drops and retrains the
link. The MHCCIF DEV_EVT_H2D_DEVICE_RESET fallback below may drop the link
too, depending on the firmware.

Neither path is wrapped in pci_hp_ignore_link_change() and
pci_hp_unignore_link_change() on pdev->bus->self. Their kernel-doc covers
this case:

 * Mark the beginning of a code section causing spurious link changes on the
 * Secondary Bus of @pdev, e.g. as a side effect of a Secondary Bus Reset,
 * D3cold transition, firmware update or FPGA reconfiguration.
 ...
 * Must be paired with pci_hp_unignore_link_change().  May be called both
 * from the PCI core and from Endpoint drivers.

pciehp_ist() ignores the link events only when that bracket is set:

drivers/pci/hotplug/pciehp_hpc.c:pciehp_ist() {
    ...
	if ((events & (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC)) &&
	    (pci_dpc_recovered(pdev) || pci_hp_spurious_link_change(pdev)) &&
	    ctrl->state == ON_STATE) {
    ...
}

Without the bracket, on a hotplug-capable upstream port,
pciehp_handle_presence_or_link_change() would disable the slot, mark the
device disconnected and re-enumerate it.

Once the device is marked disconnected, pci_device_is_present() returns
false. The 50 x 20 ms poll on mtk_pci_link_check() then runs to the end and
the "device not back" warning fires. pci_restore_state() is then sent to a
device the core has already given up on.

The core's own pciehp_reset_slot() brackets its link-dropping bus reset with
these helpers. Would it make sense to do the same around both reset paths
here? mtk_pci_shutdown() runs this same code during a kexec reboot.

This is still the same at the end of the series.

> +	if (!ret) {
> +		/* MRST._RST may return before the link has retrained, and a
> +		 * config write the device does not take is simply lost.
> +		 */
> +		for (i = 0; i < MTK_PLDR_READY_POLLS && !mtk_pci_link_check(mdev); i++)
> +			msleep(MTK_PLDR_READY_POLL_MS);
> +		if (!mtk_pci_link_check(mdev))
> +			dev_warn(dev, "device not back %d ms after reset, its config space may not be restored\n",
> +				 MTK_PLDR_READY_POLLS * MTK_PLDR_READY_POLL_MS);
> +	} else if (!mtk_pci_link_check(mdev)) {
> +		dev_warn(dev, "PLDR failed (%d) and link is down, modem not reset\n", ret);
> +	} else {
> +		dev_warn(dev, "PLDR failed (%d), trying MHCCIF reset\n", ret);
> +		if (mtk_pci_send_ext_evt(mdev, DEV_EVT_H2D_DEVICE_RESET)) {

[ ... ]

> +	/* The reset returned the endpoint to its power-on defaults: put back
> +	 * the saved config space for the next driver that binds.
> +	 */
> +	pci_restore_state(pdev);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-t9xx_driver_v1-v12-0-e181b616b820%40compal.com
