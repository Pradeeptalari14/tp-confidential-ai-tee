from manim import *

class ConfidentialTEEAnimation(Scene):
    def construct(self):
        title = Text("Confidential AI & NVIDIA H100 TEE", font_size=32, color=GOLD)
        title.to_edge(UP)
        self.play(Write(title))

        host = Rectangle(width=4.5, height=2, color=RED).shift(LEFT * 3)
        host_txt = Text("Untrusted Host OS\n(Access Blocked)", font_size=16).move_to(host)

        enclave = Rectangle(width=4.5, height=2, color=GREEN).shift(RIGHT * 3)
        enclave_txt = Text("NVIDIA H100 TEE\n(Encrypted VRAM)", font_size=16).move_to(enclave)

        barrier = DashedLine(UP * 2.5, DOWN * 2.5, color=YELLOW)

        self.play(Create(host), Write(host_txt))
        self.play(Create(barrier))
        self.play(Create(enclave), Write(enclave_txt))
        self.wait(1)
