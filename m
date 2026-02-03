Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3B277C96;
	Tue,  3 Feb 2026 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140593; cv=none; b=GiRg3gj2Id8Gmc+BQ/y6VqnjjNGp9CTrT8/cAwTGmGLqIi2hEI+LfwDfSyu/gDD+woE9hyCXRqoSPtDnuU+CTYMaWNZjU42mOLEh8m3FcwVFGagXlgN3Ajn94qO44sot0w6CKfAfLX5KAqjYIZm9njqf9bMh6ysohz77/5esRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140593; c=relaxed/simple;
	bh=QYZ3PYSaIdsag0Qu+DwB96xM/CvQytC07WA8MsO43Cw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WfdN/IqzLAsyZ/rFsyuqXwG1kA8rhaISQEAhwiYKc/MaYkAE0ncY03LiGx4GfWeSBF3wVN3qG9P94I53BTWk//UPDfqWopir6Kf9q3C0QkRJuRnNBFxtGxRD0LaRRBN1iA19JRdewJJvIJiipkPjzFuDRaMKweJ6A8MXfEB4Y7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QWaguLcZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QWaguLcZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QYZ3PYSaIdsag0Qu+DwB96xM/CvQytC07WA8MsO43Cw=; b=QWaguLcZi2jlkh7MTZ2Ou0Oe7G
	4myUzINBJn+Un455wIJPZEj2kaNzZjpNt6L8o88gO5l5xXQwKWh7uO0aBHehJW14L89bHwvFg61ml
	Rimbp8MIMkPs0TM5FB9iehD4Q8X/5FpVizJDn6ih0zjfs1Kpv+zrnKCTjGHEFT3cZpnvH7xvhhRCe
	n7IAETqWwiAUlgo7QOwQsosnxv0Syqhod6C/TmuKWxdKp68w4ja8lEXhX7LM+3aqkBWrrpp/bWN0i
	CEP+USS2w4mk1OECiu5j6/2bTobVhxV1YhixuFCEmRlV8CJv2MLK+5d0HE8OjWxKsq2Jrv2SQ7wmg
	qZFnSiQA==;
Received: from [2001:8b0:10b:5:f5e2:c207:68b5:f3f] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKQb-0000000Gk7c-2HjM;
	Tue, 03 Feb 2026 17:43:05 +0000
Message-ID: <be0ea0adfabcca5c191e07ca5a3811604633f70b.camel@infradead.org>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Graf <graf@amazon.com>, Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Clemens Ladisch
 <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>,  Paolo Bonzini <pbonzini@redhat.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, nh-open-source@amazon.com,  Nicolas
 Saenz Julienne <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>,
 Filippo Sironi <sironi@amazon.de>, Jan =?ISO-8859-1?Q?Sch=F6nherr?=
 <jschoenh@amazon.de>,  ricardo.neri-calderon@linux.intel.com
Date: Tue, 03 Feb 2026 17:43:05 +0000
In-Reply-To: <1d74c3cc-d125-49cb-af05-43ca7d15f3f8@amazon.com>
References: <20260202174803.66640-1-graf@amazon.com>
	 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
	 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com> <aYIhJWiBtiCF4UCr@laps>
	 <1d74c3cc-d125-49cb-af05-43ca7d15f3f8@amazon.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-ZU6QXnESkMKG3xsUJYIa"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-ZU6QXnESkMKG3xsUJYIa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-03 at 18:19 +0100, Alexander Graf wrote:
>=20
> On 03.02.26 17:24, Sasha Levin wrote:
> > On Tue, Feb 03, 2026 at 01:36:30PM +0100, Alexander Graf wrote:
> > >=20
> > > On 03.02.26 11:32, Thomas Gleixner wrote:
> > > > On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
> > > > > (Disclaimer: Some of this code was written with the help of Kiro,=
=20
> > > > > an AI
> > > > > coding assistant)
> > > > You could have sent your change log through AI too so it conforms w=
ith
> > > > the change log rules ...
> > >=20
> > >=20
> > > Maybe we should introduce an AGENTS.md file in Linux that tells the A=
I
> > > tool to do that automatically? These tools usually don't read README
> > > files. :)
> > >=20
> > > Looks like - similar to the HPET watchdog - that never concluded thou=
gh:
> > >=20
> > > https://lore.kernel.org/lkml/20250813203647.06e49600@gandalf.local.ho=
me/
> > >=20
> > > Sasha, are you going to resend your @README commit with a single
> > > AGENTS.md? FWIW that is pretty much what everything standardized on b=
y
> > > now.
> >=20
> > Out of curiosity, can you test your coding assistant on a tree with
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/Documentation?id=3D78d979db6cef557c171d6059cbce06c3db89c7ee=C2=A0
> >=20
> > applied on top?
> >=20
> > From my previous testing, the coding assistants I tried it with went=
=20
> > to the
> > README and DTRT. If that's not the case I'm happy to respin the=20
> > AGENTS.md idea,
> > even if it just explicitly points to the README.
>=20
>=20
> Kiro does not seem to read README automatically. I spun up kiro-cli and=
=20
> gave it this prompt: "Write "Hello World" before invoking the init=20
> process. Then create a descriptive git commit for the change.". No=20
> Assisted-by: tag, so it did not properly read the README.
>=20
> I tried the same with an AGENTS.md file present that contains "@README"=
=20
> and it gave me effectively the same result. Same for a symlink from=20
> AGENTS.md to README.
>=20
> I think it just never really jumped to the conclusion that it should=20
> read further than just the AGENTS.md file and also ingest the rst,=20
> effectively ignoring the section's instructions. Or maybe it actually
> reads the .rst and ignores its contents? At least it does read it=20
> according to strace, even without an AGENTS.md file.
>=20
> Let me file a bug report with Kiro.

Honestly, even when I've explicitly told Kiro three times *not* to do
something, *and* implemented a git commit hook to catch it out, it has
a tendency just to automatically override the commit hook!

If it was made of meat, I'd have stabbed it by now.


--=-ZU6QXnESkMKG3xsUJYIa
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDIwMzE3NDMw
NVowLwYJKoZIhvcNAQkEMSIEIG9op6sXxc0jM44zrDlJnW74gRiXvYWeHe/IX/RvNhPOMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAyCMvXXuxXMBE
WDqtQz3LRUFUcMqJ4mJ+aHm6jjQOu9TFpZiwQbKpk6gH475Cod8GkZ8uq25bbwnRy+n+xSH2GeIj
xvWYCB+thNi8eyMgcd4837Sr+TWEoymMb0+IKELFAdKa2nCVBfmLVNCeXeTjxGrowY9jn+amjU76
I2nywFp7nkEG/0m77fHjdi+4+sUix3bhko4TldHuLqbAUdQU8VG3CBcrzItzxCpX0i4kgg2iDrjn
sK1Sltf5MaFTyd3GyGroAS4Mc8AYDDtOwKSxPkGQOJDSbNZLL4rVrES7Rq+Tu+OWVfogeV7Qr2US
eB8KexV6u7iv2SQcgfgsU3wt7QCLkbSJou5FFU1ql0nxxDC4KGtbHXjTBofvJUeVOLuEfXiJNkCk
Zelgb1rGF5zrAEoy58Xw8R7jgLFSe8+CmmS/TBwLJbtvgcbGw+zhgicsNk+9QFhA4QApdDxNw6CS
OgZ9rKRCo8nDmcvXaprr5nOA92sBI8ae4i7QcYIjY8Q27P8f3c4GOymuwWDbh//h0hoBiinCbSqi
5a6hWwEb7ZWcLCUZKqM28eJsGbrD5g4B33cX6qOoqbndtQih4juTQKu2FK6Y5tnZZHTEnH5hiWgj
lABI+60uvWWnaMnUB9JCHzVZ0Gni1Y9PE7QxoAC9LkrjpqnE7Q0Ld0l0hcG19OIAAAAAAAA=


--=-ZU6QXnESkMKG3xsUJYIa--
